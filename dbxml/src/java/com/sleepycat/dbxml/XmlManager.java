/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.39
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.sleepycat.dbxml;

    import com.sleepycat.db.Environment;
    import com.sleepycat.db.Transaction;
    import com.sleepycat.db.TransactionConfig;
    import com.sleepycat.db.VerifyConfig;
    import com.sleepycat.db.DatabaseException;
    import com.sleepycat.db.internal.DbEnv;
    import com.sleepycat.db.internal.DbConstants;
    import com.sleepycat.db.XmlHelper;
    import java.util.LinkedList;

public class XmlManager {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected XmlManager(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(XmlManager obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public void delete() /* no exception */ {
    closeInternal();
    if(swigCPtr != 0 && swigCMemOwn) {
	swigCMemOwn = false;
	dbxml_javaJNI.delete_XmlManager(swigCPtr);
    }
    swigCPtr = 0;
 }


    private Environment dbenv;
    private XmlContainerConfig defaultConfig = new XmlContainerConfig();
    private boolean threaded = true; // default on if no Environment
    private boolean adopted = false;
    private XmlManagerConfig config = null;
	private LinkedList<XmlCompression> compressionStore;
    private LinkedList<XmlResolver> resolverStore;

    public XmlManager(final Environment dbenv,
		      XmlManagerConfig config)
	throws XmlException {
	this(dbxml_javaJNI.new_XmlManager(XmlHelper.getDbEnv(dbenv),
					  ((config == null ) ? 0 :
					   config.makeFlags())),true);
	this.dbenv = dbenv;
	this.config = config;
	if ((config != null) && (config.getAdoptEnvironment()))
	    this.adopted = true;
	try {
	    threaded =
		((XmlHelper.getDbEnv(dbenv).get_open_flags() &
		  DbConstants.DB_THREAD) != 0);
	} catch (DatabaseException de) {
	    throw new XmlException(XmlException.DATABASE_ERROR,
				   de.toString(), de,
				   de.getErrno(), 0, 0);
	}
    }

    public XmlManager(XmlManagerConfig config)
	throws XmlException, java.io.FileNotFoundException {
	DbEnv newEnv = null;
	try {
	    newEnv = new DbEnv(0);
	    newEnv.set_cachesize(64 * 1024 * 1024, 1); // 64MB cache
	    newEnv.set_errpfx("BDB XML");
	    newEnv.open(null, DbConstants.DB_PRIVATE|
			DbConstants.DB_CREATE|DbConstants.DB_INIT_MPOOL|
			DbConstants.DB_THREAD, 0);
	    this.dbenv = XmlHelper.makeNewEnvironment(newEnv);
	} catch (DatabaseException de) {
	    throw new XmlException(XmlException.DATABASE_ERROR,
				   de.toString(), de,
				   de.getErrno(), 0, 0);
	}
	this.adopted = true;
	this.config = config;
	// do what the SWIG-generated ctor does, in order to
	// create a C++ XmlManager object.  Add ADOPT flag,
	// since the DbEnv was internally constructed.
	int flags = (config == null) ? 0 : config.makeFlags();
	swigCPtr = dbxml_javaJNI.new_XmlManager(newEnv, flags);
	swigCMemOwn = true;
    }

    public XmlManager()
	throws XmlException, java.io.FileNotFoundException {
	this(null);
    }

    public Environment getEnvironment() throws XmlException {
	return dbenv;
    }

    public XmlManagerConfig getManagerConfig() throws XmlException {
	return config;
    }

    public synchronized void setDefaultContainerConfig(XmlContainerConfig config) throws XmlException {
	this.defaultConfig = config;
    }

    public XmlContainerConfig getDefaultContainerConfig() throws XmlException {
	return defaultConfig;
    }
    
    public XmlUpdateContext createUpdateContext() throws XmlException { 
	return new XmlUpdateContext(this);
    }
    
    public XmlQueryContext createQueryContext() throws XmlException{
	XmlQueryContext xqc = 
	    new XmlQueryContext(XmlQueryContext.LiveValues, XmlQueryContext.Eager);
	xqc.mgr = this;
	return xqc;
    }
    
    public XmlQueryContext createQueryContext(int rt, int et) throws XmlException{
	XmlQueryContext xqc = new XmlQueryContext(rt, et);
	xqc.mgr = this;
	return xqc;
    }
    
    public XmlQueryContext createQueryContext(int rt) throws XmlException{
	XmlQueryContext xqc = new XmlQueryContext(rt, XmlQueryContext.Eager);
	xqc.mgr = this;
	return xqc;
    }

    public XmlInputStream createInputStream(java.io.InputStream is) throws XmlException {
	return new NativeXmlInputStream(is);
    }

    public XmlContainer createContainer(String name)
	throws XmlException {
	return createContainer(name, defaultConfig);
    }

    public XmlContainer createContainer(XmlTransaction txn, String name)
	throws XmlException {
	return createContainer(txn, name, defaultConfig);
    }

    public XmlContainer openContainer(String name)
	throws XmlException {
	return openContainer(name, defaultConfig);
    }

    public XmlContainer openContainer(XmlTransaction txn, String name)
	throws XmlException {
	return openContainer(txn, name, defaultConfig);
    }
    
    private void setContainerConfig(XmlContainerConfig config, XmlContainer cont)
    {
	cont.setManager(this);
	int[] data = new int[8];
	String compName = cont.getContainerConfigData(data);
	config = new XmlContainerConfig(data);
	config.setCompression(compName);
	cont.setContainerConfig(config);
    }

    public XmlContainer createContainer(String name,
					XmlContainerConfig config)
	throws XmlException {
	XmlContainer cont = createContainerInternal(name, config);
	setContainerConfig(config, cont);
	return cont;
    }

    public XmlContainer createContainer(XmlTransaction txn,
					String name,
					XmlContainerConfig config)
	throws XmlException {
	XmlContainer cont = createContainerInternal(txn, name, config);
	setContainerConfig(config, cont);
	return cont;
    }

    public XmlContainer openContainer(String name,
				      XmlContainerConfig config)
	throws XmlException {
	XmlContainer cont = openContainerInternal(name, config);
	setContainerConfig(config, cont);
	return cont;
    }

    public XmlContainer openContainer(XmlTransaction txn,
				      String name,
				      XmlContainerConfig config)
	throws XmlException {
	XmlContainer cont = openContainerInternal(txn, name, config);
	setContainerConfig(config, cont);
	return cont;
    }
    
    public void setDefaultCompression(String name)
    {
	synchronized (defaultConfig) {
	    defaultConfig.setCompression(name);
	}
    }
    public String getDefaultCompression()
    {
	return defaultConfig.getCompression();
    }
	
    public void setDefaultContainerType(int type) 
    {
	synchronized (defaultConfig) {
	    defaultConfig.setContainerType(type);
	}
    }

    public int getDefaultContainerType() 
    {
	return defaultConfig.getContainerType();
    }
	
    public void setDefaultPageSize(int pageSize) throws XmlException {
	synchronized (defaultConfig) {
	    defaultConfig.setPageSize(pageSize);
	}
    }

    public int getDefaultPageSize() throws XmlException {
	return defaultConfig.getPageSize();
    }

    public void setDefaultSequenceIncrement(int incr) throws XmlException {
	synchronized (defaultConfig) {
	    defaultConfig.setSequenceIncrement(incr);
	}
    }

    public int getDefaultSequenceIncrement() throws XmlException {
	return defaultConfig.getSequenceIncrement();
    }

    public XmlTransaction createTransaction(com.sleepycat.db.Transaction toUse)
	throws XmlException {
	XmlTransaction txn = createTransaction(XmlHelper.getDbTxn(toUse));
	txn.setTransaction(toUse);
	return txn;
    }

    public XmlTransaction createTransaction(final Transaction parent,
					    TransactionConfig config)
	throws XmlException {
	Transaction newTxn = null;
	try {
	    newTxn = dbenv.beginTransaction(parent, config);
	} catch (DatabaseException de) {
	    throw new XmlException(XmlException.DATABASE_ERROR,
				   de.toString(), de,
				   de.getErrno(), 0, 0);
	}
	return createTransaction(newTxn);
    }

    public XmlTransaction createTransaction()
	throws XmlException {
	return createTransaction(null, null);
    }
    
    public XmlIndexLookup createIndexLookup(XmlContainer cont, 
					    String uri, String name, String index, 
					    XmlValue value, int op) 
	throws XmlException {
	XmlIndexLookup lookup = createIndexLookupInternal(cont, uri, name, index, value, op);
	lookup.container = cont;
	lookup.lowBoundValue = value;
	return lookup;
    }
	
    public XmlIndexLookup createIndexLookup(XmlContainer cont, 
					    String uri, String name, String index, 
					    XmlValue value) 
	throws XmlException {
	XmlIndexLookup lookup = createIndexLookupInternal(cont, uri, name, index, value);
	lookup.container = cont;
	lookup.lowBoundValue = value;
	return lookup;
    }
	
    public XmlIndexLookup createIndexLookup(XmlContainer cont, 
					    String uri, String name, String index) 
	throws XmlException {
	XmlIndexLookup lookup = createIndexLookupInternal(cont, uri, name, index);
	lookup.container = cont;
	return lookup;
    }
    
    public XmlDocument createDocument()
	throws XmlException {
	XmlDocument doc = createDocumentInternal();
	doc.setManager(this);
	return doc;
    }

    public XmlResults query(String query,
			    XmlQueryContext context,
			    XmlDocumentConfig config)
	throws XmlException {
	int flags = (config == null) ? 0 : config.makeFlags();
	return query(query, context, flags);
    }

    public XmlResults query(XmlTransaction txn,
			    String query,
			    XmlQueryContext context,
			    XmlDocumentConfig config)
	throws XmlException {
	int flags = (config == null) ? 0 : config.makeFlags();
	return query(txn, query, context, flags);
    }
    
    public void reindexContainer(String name,
				 XmlUpdateContext context,
				 XmlContainerConfig config)
	throws XmlException {
	reindexContainer(name, config);
    }

    public void reindexContainer(XmlTransaction txn,
				 String name,
				 XmlUpdateContext context,
				 XmlContainerConfig config)
	throws XmlException {
	reindexContainer(txn, name, config);
    }
    
    public void loadContainer(String name, String filename, XmlUpdateContext uc) throws XmlException
    {
	loadContainer(name, filename);
    }

    public void verifyContainer(String name,
				String filename,
				VerifyConfig config)
	throws XmlException {
	int flags = 0;
	if (config.getAggressive())
	    flags |= DbConstants.DB_AGGRESSIVE;
	if (config.getSalvage())
	    flags |= DbConstants.DB_SALVAGE;
	if (config.getPrintable())
	    flags |= DbConstants.DB_PRINTABLE;
	if (config.getOrderCheckOnly())
	    flags |= DbConstants.DB_ORDERCHKONLY;
	if (config.getNoOrderCheck())
	    flags |= DbConstants.DB_NOORDERCHK;
	verifyContainer(name, filename, flags);
    }
    
    public void upgradeContainer(String name, XmlUpdateContext uc) throws XmlException
    {
	upgradeContainer(name);
    }
    public void compactContainer(String name, XmlUpdateContext uc) throws XmlException
    {
	compactContainer(name);
    }
    public void compactContainer(XmlTransaction txn, String name, XmlUpdateContext uc) throws XmlException
    {
	compactContainer(txn, name);
    }
    public void truncateContainer(String name, XmlUpdateContext uc) throws XmlException
    {
	truncateContainer(name);
    }
    public void truncateContainer(XmlTransaction txn, String name, XmlUpdateContext uc) throws XmlException
    {
	truncateContainer(txn, name);
    }
	
    private synchronized void setResolver(XmlResolver resolver)
				  {
				      if (resolverStore == null) resolverStore = new LinkedList<XmlResolver>();
				      resolverStore.add(resolver);  //prevents premature garbage collection
				  }
	
	public void registerResolver(XmlResolver resolver) throws XmlException
    {
    	setResolver(resolver);
    	registerResolverInternal(resolver);
    }
	
    private synchronized void setCompression(XmlCompression compression)
				  {
				      if (compressionStore == null) compressionStore = new LinkedList<XmlCompression>();
				      compressionStore.add(compression);  //prevents premature garbage collection
				  }
    
    public void registerCompression(String name, XmlCompression compression) throws XmlException
    {
    	setCompression(compression);
    	registerCompressionInternal(name, compression);
    }

    protected void closeInternal() {
	if (adopted) {
	    try {
		dbenv.close();
	    } catch (DatabaseException de) {}
	}
	adopted = false;
	this.dbenv = null;
	this.config = null;
    }

    public void close() throws XmlException {
	delete();
    }

    public final static int LEVEL_NONE = dbxml_java.LEVEL_NONE;
    public final static int LEVEL_DEBUG = dbxml_java.LEVEL_DEBUG;
    public final static int LEVEL_INFO = dbxml_java.LEVEL_INFO;
    public final static int LEVEL_WARNING = dbxml_java.LEVEL_WARNING;
    public final static int LEVEL_ERROR = dbxml_java.LEVEL_ERROR;
    public final static int LEVEL_ALL = dbxml_java.LEVEL_ALL;
    public final static int CATEGORY_NONE = dbxml_java.CATEGORY_NONE;
    public final static int CATEGORY_INDEXER = dbxml_java.CATEGORY_INDEXER;
    public final static int CATEGORY_QUERY = dbxml_java.CATEGORY_QUERY;
    public final static int CATEGORY_OPTIMIZER = dbxml_java.CATEGORY_OPTIMIZER;
    public final static int CATEGORY_DICTIONARY = dbxml_java.CATEGORY_DICTIONARY;
    public final static int CATEGORY_CONTAINER = dbxml_java.CATEGORY_CONTAINER;
    public final static int CATEGORY_NODESTORE = dbxml_java.CATEGORY_NODESTORE;
    public final static int CATEGORY_MANAGER = dbxml_java.CATEGORY_MANAGER;
    public final static int CATEGORY_ALL = dbxml_java.CATEGORY_ALL;
    public final static String metaDataNamespace_uri = dbxml_javaConstants.metaDataNamespace_uri;
    public final static String metaDataNamespace_prefix = dbxml_javaConstants.metaDataNamespace_prefix;
    public final static String metaDataName_name = dbxml_javaConstants.metaDataName_name;
    public final static String metaDataName_root = dbxml_javaConstants.metaDataName_root;
    
  public XmlManager(com.sleepycat.db.internal.DbEnv dbEnv, int flags) throws XmlException {
    this(dbxml_javaJNI.new_XmlManager(dbEnv, flags), true);
  }

  public String getHome() throws XmlException {
    return dbxml_javaJNI.XmlManager_getHome(swigCPtr, this);
  }

  public int getImplicitTimezone() throws XmlException {
    return dbxml_javaJNI.XmlManager_getImplicitTimezone(swigCPtr, this);
  }

  public void setImplicitTimezone(int tz) throws XmlException {
    dbxml_javaJNI.XmlManager_setImplicitTimezone(swigCPtr, this, tz);
  }

  public int existsContainer(String name) throws XmlException {
    return dbxml_javaJNI.XmlManager_existsContainer(swigCPtr, this, name);
  }

  public void removeContainer(String name) throws XmlException {
    dbxml_javaJNI.XmlManager_removeContainer__SWIG_0(swigCPtr, this, name);
  }

  public void removeContainer(XmlTransaction txn, String name) throws XmlException {
    dbxml_javaJNI.XmlManager_removeContainer__SWIG_1(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, name);
  }

  public void renameContainer(String oldName, String newName) throws XmlException {
    dbxml_javaJNI.XmlManager_renameContainer__SWIG_0(swigCPtr, this, oldName, newName);
  }

  public void renameContainer(XmlTransaction txn, String oldName, String newName) throws XmlException {
    dbxml_javaJNI.XmlManager_renameContainer__SWIG_1(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, oldName, newName);
  }

  public XmlInputStream createStdInInputStream() throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_createStdInInputStream(swigCPtr, this);
    return (cPtr == 0) ? null : new XmlInputStream(cPtr, false);
  }

  public XmlInputStream createLocalFileInputStream(String filename) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_createLocalFileInputStream(swigCPtr, this, filename);
    return (cPtr == 0) ? null : new XmlInputStream(cPtr, false);
  }

  public XmlInputStream createMemBufInputStream(String bytes, long count, String id, boolean adopt) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_createMemBufInputStream__SWIG_0(swigCPtr, this, bytes, count, id, adopt);
    return (cPtr == 0) ? null : new XmlInputStream(cPtr, false);
  }

  public XmlInputStream createMemBufInputStream(String bytes, long count, String id) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_createMemBufInputStream__SWIG_1(swigCPtr, this, bytes, count, id);
    return (cPtr == 0) ? null : new XmlInputStream(cPtr, false);
  }

  public XmlInputStream createMemBufInputStream(String bytes, long count, boolean copyBuffer) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_createMemBufInputStream__SWIG_2(swigCPtr, this, bytes, count, copyBuffer);
    return (cPtr == 0) ? null : new XmlInputStream(cPtr, false);
  }

  public XmlInputStream createURLInputStream(String baseId, String systemId, String publicId) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_createURLInputStream__SWIG_0(swigCPtr, this, baseId, systemId, publicId);
    return (cPtr == 0) ? null : new XmlInputStream(cPtr, false);
  }

  public XmlInputStream createURLInputStream(String baseId, String systemId) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_createURLInputStream__SWIG_1(swigCPtr, this, baseId, systemId);
    return (cPtr == 0) ? null : new XmlInputStream(cPtr, false);
  }

  public void dumpContainer(String name, String filename) throws XmlException {
    dbxml_javaJNI.XmlManager_dumpContainer(swigCPtr, this, name, filename);
  }

  protected void verifyContainer(String name, String filename, int flags) {
    dbxml_javaJNI.XmlManager_verifyContainer__SWIG_0(swigCPtr, this, name, filename, flags);
  }

  public void verifyContainer(String name, String filename) throws XmlException {
    dbxml_javaJNI.XmlManager_verifyContainer__SWIG_1(swigCPtr, this, name, filename);
  }

  public XmlQueryExpression prepare(String query, XmlQueryContext context) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_prepare__SWIG_0(swigCPtr, this, query,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context );
    return (cPtr == 0) ? null : new XmlQueryExpression(cPtr, true);
  }

  public XmlQueryExpression prepare(XmlTransaction txn, String query, XmlQueryContext context) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_prepare__SWIG_1(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, query,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context );
    return (cPtr == 0) ? null : new XmlQueryExpression(cPtr, true);
  }

  protected XmlResults query(String query, XmlQueryContext context, int flags) {
    long cPtr = dbxml_javaJNI.XmlManager_query__SWIG_0(swigCPtr, this, query,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context , flags);
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  protected XmlResults query(XmlTransaction txn, String query, XmlQueryContext context, int flags) {
    long cPtr = dbxml_javaJNI.XmlManager_query__SWIG_1(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, query,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context , flags);
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  public XmlResults query(String query, XmlQueryContext context) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_query__SWIG_2(swigCPtr, this, query,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context );
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  public XmlResults query(XmlTransaction txn, String query, XmlQueryContext context) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_query__SWIG_3(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, query,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context );
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  public XmlResults createResults() throws XmlException {
    long cPtr = dbxml_javaJNI.XmlManager_createResults(swigCPtr, this);
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  protected XmlTransaction createTransaction(com.sleepycat.db.internal.DbTxn toAdopt) {
    long cPtr = dbxml_javaJNI.XmlManager_createTransaction(swigCPtr, this, toAdopt);
    return (cPtr == 0) ? null : new XmlTransaction(cPtr, true);
  }

  protected XmlIndexLookup createIndexLookupInternal(XmlContainer cont, String uri, String name, String index, XmlValue value, int op) {
    long cPtr = dbxml_javaJNI.XmlManager_createIndexLookupInternal__SWIG_0(swigCPtr, this, XmlContainer.getCPtr(cont), cont, uri, name, index, value, op);
    return (cPtr == 0) ? null : new XmlIndexLookup(cPtr, true);
  }

  protected XmlIndexLookup createIndexLookupInternal(XmlContainer cont, String uri, String name, String index, XmlValue value) {
    long cPtr = dbxml_javaJNI.XmlManager_createIndexLookupInternal__SWIG_1(swigCPtr, this, XmlContainer.getCPtr(cont), cont, uri, name, index, value);
    return (cPtr == 0) ? null : new XmlIndexLookup(cPtr, true);
  }

  protected XmlIndexLookup createIndexLookupInternal(XmlContainer cont, String uri, String name, String index) {
    long cPtr = dbxml_javaJNI.XmlManager_createIndexLookupInternal__SWIG_2(swigCPtr, this, XmlContainer.getCPtr(cont), cont, uri, name, index);
    return (cPtr == 0) ? null : new XmlIndexLookup(cPtr, true);
  }

  public static void setLogLevel(int level, boolean enabled) throws XmlException {
    dbxml_javaJNI.XmlManager_setLogLevel(level, enabled);
  }

  public static void setLogCategory(int category, boolean enabled) throws XmlException {
    dbxml_javaJNI.XmlManager_setLogCategory(category, enabled);
  }

  public static int get_version_major() {
    return dbxml_javaJNI.XmlManager_get_version_major();
  }

  public static int get_version_minor() {
    return dbxml_javaJNI.XmlManager_get_version_minor();
  }

  public static int get_version_patch() {
    return dbxml_javaJNI.XmlManager_get_version_patch();
  }

  public static String get_version_string() {
    return dbxml_javaJNI.XmlManager_get_version_string();
  }

  public XmlContainer createContainerInternal(String name, XmlContainerConfig config) throws XmlException {
    return new XmlContainer(dbxml_javaJNI.XmlManager_createContainerInternal__SWIG_0(swigCPtr, this, name,  config.pack(), config.getCompression() ), true);
  }

  public XmlContainer createContainerInternal(XmlTransaction txn, String name, XmlContainerConfig config) throws XmlException {
    return new XmlContainer(dbxml_javaJNI.XmlManager_createContainerInternal__SWIG_1(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, name,  config.pack(), config.getCompression() ), true);
  }

  public XmlContainer openContainerInternal(String name, XmlContainerConfig config) throws XmlException {
    return new XmlContainer(dbxml_javaJNI.XmlManager_openContainerInternal__SWIG_0(swigCPtr, this, name,  config.pack(), config.getCompression() ), true);
  }

  public XmlContainer openContainerInternal(XmlTransaction txn, String name, XmlContainerConfig config) throws XmlException {
    return new XmlContainer(dbxml_javaJNI.XmlManager_openContainerInternal__SWIG_1(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, name,  config.pack(), config.getCompression() ), true);
  }

  public XmlDocument createDocumentInternal() throws XmlException { return dbxml_javaJNI.XmlManager_createDocumentInternal(swigCPtr, this); }

  public void upgradeContainer(String name) throws XmlException {
    dbxml_javaJNI.XmlManager_upgradeContainer(swigCPtr, this, name);
  }

  public void compactContainer(String name) throws XmlException {
    dbxml_javaJNI.XmlManager_compactContainer__SWIG_0(swigCPtr, this, name);
  }

  public void compactContainer(XmlTransaction txn, String name) throws XmlException {
    dbxml_javaJNI.XmlManager_compactContainer__SWIG_1(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, name);
  }

  public void truncateContainer(String name) throws XmlException {
    dbxml_javaJNI.XmlManager_truncateContainer__SWIG_0(swigCPtr, this, name);
  }

  public void truncateContainer(XmlTransaction txn, String name) throws XmlException {
    dbxml_javaJNI.XmlManager_truncateContainer__SWIG_1(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, name);
  }

  public void reindexContainer(String name, XmlContainerConfig flags) throws XmlException {
    dbxml_javaJNI.XmlManager_reindexContainer__SWIG_0(swigCPtr, this, name,  flags.pack(), flags.getCompression() );
  }

  public void reindexContainer(XmlTransaction txn, String name, XmlContainerConfig flags) throws XmlException {
    dbxml_javaJNI.XmlManager_reindexContainer__SWIG_1(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, name,  flags.pack(), flags.getCompression() );
  }

  public void loadContainer(String name, String filename) throws XmlException {
    dbxml_javaJNI.XmlManager_loadContainer(swigCPtr, this, name, filename);
  }

  public void registerCompressionInternal(String name, XmlCompression compression) throws XmlException {
    dbxml_javaJNI.XmlManager_registerCompressionInternal(swigCPtr, this, name,  XmlCompression.getCPtr(compression) , compression);
  }

  public void registerResolverInternal(XmlResolver resolver) throws XmlException {
    dbxml_javaJNI.XmlManager_registerResolverInternal(swigCPtr, this, XmlResolver.getCPtr(resolver), resolver);
  }

}
