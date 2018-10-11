package es.unican.lavoisier.domainModelProvider

import java.util.ArrayList
import java.util.List
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet

class DomainModelProvider {

  private static String DOMAIN_MODEL_NSURI = ""
  private static String DOMAIN_MODEL_INSTANCE_FILE = ""

  private static EPackage DOMAIN_MODEL
  private static Resource DOMAIN_INSTANCE_RESOURCE


  private static List<IDomainModelUser> domainModelUsers =
    new ArrayList<IDomainModelUser>;

  private new() {

  }

  def static init() {
  }

  private static def domainReferenceChanges(String domainModelNSURI,
                             String domainModelInstanceFile) {
    return !DOMAIN_MODEL_NSURI.equals(domainModelNSURI) ||
           !DOMAIN_MODEL_INSTANCE_FILE.equals(domainModelInstanceFile)
  }


  def static loadDomainModelResources(ResourceSet resourceSet,
                               String domainModelNSURI,
                               String domainModelInstance) {
    if (!domainReferenceChanges(domainModelNSURI, domainModelInstance)) {
      // disabled for testing purposes
      //  return // no changes in model references
    }
    DOMAIN_MODEL_NSURI = domainModelNSURI;
    DOMAIN_MODEL_INSTANCE_FILE = domainModelInstance;

    DOMAIN_MODEL = resourceSet.getResource(URI.createURI(domainModelNSURI), true)
                      .contents.get(0) as EPackage

    DOMAIN_INSTANCE_RESOURCE =
      resourceSet.getResource(
          URI.createPlatformResourceURI(domainModelInstance, true),
          true)

    //update linked domain models
    for (user : domainModelUsers) {
      user.setDomainModel(DOMAIN_MODEL)
    }
  }

  def static getDomainModel() {
    return DOMAIN_MODEL
  }

  def static getDomainInstanceResource() {
    return DOMAIN_INSTANCE_RESOURCE
  }

  def static linkDomainModel(IDomainModelUser user) {
    domainModelUsers.add(user)
    user.setDomainModel(DOMAIN_MODEL)
  }

}
