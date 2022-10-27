package es.unican.istr.lavoisier.generator

import java.util.ArrayList
import java.util.List
import org.eclipse.emf.ecore.EClass
import org.eclipse.emf.ecore.EReference
import org.eclipse.emf.ecore.EObject

class ReferenceContext {

  EClass mainEClass
  List<EReference> referenceJumps
  String prefix

  new(EClass mainEClass) {
    this.mainEClass = mainEClass
    referenceJumps = new ArrayList<EReference>
    prefix = new String()
  }

  // copy constructor
  new (ReferenceContext rc) {
    mainEClass = rc.mainEClass
    referenceJumps = new ArrayList<EReference> (rc.referenceJumps)
    prefix = new String(rc.prefix)
  }

  def getMainEClass() {
    return mainEClass
  }

  def getReferenceJumps() {
    return referenceJumps
  }

  def getCurrentEClass() {
    if (referenceJumps.isEmpty) {
      return mainEClass
    } else {
      return referenceJumps.get(referenceJumps.size - 1).EReferenceType
    }
  }

  def EObject getValue(EObject instance, EReference reference) {
    // instance belongs to the main class, so we should navigate all the jumps
    //   of the context, including a last jump to the reference parameter
    var EObject result = instance
    for (eRef : referenceJumps) {
      result = result.eGet(eRef) as EObject
      // stop if we find a null reference (blanks would be generated)
      if (result === null) {
        return null
      }
    }
    // up to this point, no null has been found (but it still can happen below)
    return result.eGet(reference) as EObject
  }

  def getReferenceAttributeName(String separator, String refName, String attrName) {
    return String.format("%s%s%s",
                         getPrefix(separator, refName), separator, attrName)
  }

  def private getPrefix(String separator, String lastFragment) {
    if (prefix.isEmpty) {
      return lastFragment
    }
    return String.format("%s%s%s", prefix, separator, lastFragment)
  }

  def addReferenceJump(EReference ref, String separator, String prefixFragment) {
    referenceJumps.add(ref)
    if (prefix.isEmpty) {
      prefix = prefixFragment
    } else {
      prefix = String.format("%s%s%s", prefix, separator, prefixFragment)
    }
  }

}
