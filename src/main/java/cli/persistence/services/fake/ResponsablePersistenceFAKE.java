/*
 * Created on 19 nov. 2015 ( Time 13:31:06 )
 * Generated by Telosys Tools Generator ( version 2.1.1 )
 */
package cli.persistence.services.fake;

import java.util.List;
import java.util.Map;

import cli.bean.jpa.ResponsableEntity;
import cli.persistence.commons.fake.GenericFakeService;
import cli.persistence.services.ResponsablePersistence;

/**
 * Fake persistence service implementation ( entity "Responsable" )
 *
 * @author Telosys Tools Generator
 */
public class ResponsablePersistenceFAKE extends GenericFakeService<ResponsableEntity> implements ResponsablePersistence {

	public ResponsablePersistenceFAKE () {
		super(ResponsableEntity.class);
	}
	
	protected ResponsableEntity buildEntity(int index) {
		ResponsableEntity entity = new ResponsableEntity();
		// Init fields with mock values
		entity.setNom( nextString() ) ;
		entity.setMdp( nextString() ) ;
		entity.setId( nextInteger() ) ;
		entity.setEstadmin( false ) ;
		return entity ;
	}
	
	
	public boolean delete(ResponsableEntity entity) {
		log("delete ( ResponsableEntity : " + entity + ")" ) ;
		return true;
	}

	public boolean delete( Integer id ) {
		log("delete ( PK )") ;
		return true;
	}

	public void insert(ResponsableEntity entity) {
		log("insert ( ResponsableEntity : " + entity + ")" ) ;
	}

	public ResponsableEntity load( Integer id ) {
		log("load ( PK )") ;
		return buildEntity(1) ; 
	}

	public List<ResponsableEntity> loadAll() {
		log("loadAll()") ;
		return buildList(40) ;
	}

	public List<ResponsableEntity> loadByNamedQuery(String queryName) {
		log("loadByNamedQuery ( '" + queryName + "' )") ;
		return buildList(20) ;
	}

	public List<ResponsableEntity> loadByNamedQuery(String queryName, Map<String, Object> queryParameters) {
		log("loadByNamedQuery ( '" + queryName + "', parameters )") ;
		return buildList(10) ;
	}

	public ResponsableEntity save(ResponsableEntity entity) {
		log("insert ( ResponsableEntity : " + entity + ")" ) ;
		return entity;
	}

	public List<ResponsableEntity> search(Map<String, Object> criteria) {
		log("search (criteria)" ) ;
		return buildList(15) ;
	}

	@Override
	public long countAll() {
		return 0 ;
	}

}
