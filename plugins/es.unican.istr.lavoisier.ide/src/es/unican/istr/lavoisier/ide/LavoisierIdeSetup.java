/*
 * generated by Xtext 2.25.0
 */
package es.unican.istr.lavoisier.ide;

import com.google.inject.Guice;
import com.google.inject.Injector;
import es.unican.istr.lavoisier.LavoisierRuntimeModule;
import es.unican.istr.lavoisier.LavoisierStandaloneSetup;
import org.eclipse.xtext.util.Modules2;

/**
 * Initialization support for running Xtext languages as language servers.
 */
public class LavoisierIdeSetup extends LavoisierStandaloneSetup {

	@Override
	public Injector createInjector() {
		return Guice.createInjector(Modules2.mixin(new LavoisierRuntimeModule(), new LavoisierIdeModule()));
	}
	
}
