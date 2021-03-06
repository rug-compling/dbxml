/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.39
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.sleepycat.dbxml;

public class XmlQueryExpression {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected XmlQueryExpression(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(XmlQueryExpression obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public void delete() /* no exception */ {
    if(swigCPtr != 0 && swigCMemOwn) {
	swigCMemOwn = false;
	dbxml_javaJNI.delete_XmlQueryExpression(swigCPtr);
    }
    swigCPtr = 0;
 }

    public XmlResults execute(XmlQueryContext context,
			      XmlDocumentConfig config)
	throws XmlException {
	int flags = (config == null) ? 0 : config.makeFlags();
	return execute(context, flags);
    }
    public XmlResults execute(XmlValue contextItem,
			      XmlQueryContext context,
			      XmlDocumentConfig config)
	throws XmlException {
	int flags = (config == null) ? 0 : config.makeFlags();
	return execute(contextItem, context, flags);
    }

    public XmlResults execute(XmlTransaction txn,
			      XmlQueryContext context,
			      XmlDocumentConfig config)
	throws XmlException {
	int flags = (config == null) ? 0 : config.makeFlags();
	return execute(txn, context, flags);
    }

    public XmlResults execute(XmlTransaction txn,
			      XmlValue contextItem,
			      XmlQueryContext context,
			      XmlDocumentConfig config)
	throws XmlException {
	int flags = (config == null) ? 0 : config.makeFlags();
	return execute(txn, contextItem, context, flags);
    }
    
  public XmlQueryExpression(XmlQueryExpression queryExpression) throws XmlException {
    this(dbxml_javaJNI.new_XmlQueryExpression(XmlQueryExpression.getCPtr(queryExpression), queryExpression), true);
  }

  public String getQuery() throws XmlException {
    return dbxml_javaJNI.XmlQueryExpression_getQuery(swigCPtr, this);
  }

  public String getQueryPlan() throws XmlException {
    return dbxml_javaJNI.XmlQueryExpression_getQueryPlan(swigCPtr, this);
  }

  public boolean isUpdateExpression() throws XmlException {
    return dbxml_javaJNI.XmlQueryExpression_isUpdateExpression(swigCPtr, this);
  }

  protected XmlResults execute(XmlQueryContext context, int flags) {
    long cPtr = dbxml_javaJNI.XmlQueryExpression_execute__SWIG_0(swigCPtr, this,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context , flags);
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  public XmlResults execute(XmlQueryContext context) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlQueryExpression_execute__SWIG_1(swigCPtr, this,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context );
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  protected XmlResults execute(XmlValue contextItem, XmlQueryContext context, int flags) {
    long cPtr = dbxml_javaJNI.XmlQueryExpression_execute__SWIG_2(swigCPtr, this, contextItem,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context , flags);
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  public XmlResults execute(XmlValue contextItem, XmlQueryContext context) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlQueryExpression_execute__SWIG_3(swigCPtr, this, contextItem,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context );
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  protected XmlResults execute(XmlTransaction txn, XmlQueryContext context, int flags) {
    long cPtr = dbxml_javaJNI.XmlQueryExpression_execute__SWIG_4(swigCPtr, this, XmlTransaction.getCPtr(txn), txn,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context , flags);
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  public XmlResults execute(XmlTransaction txn, XmlQueryContext context) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlQueryExpression_execute__SWIG_5(swigCPtr, this, XmlTransaction.getCPtr(txn), txn,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context );
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  protected XmlResults execute(XmlTransaction txn, XmlValue contextItem, XmlQueryContext context, int flags) {
    long cPtr = dbxml_javaJNI.XmlQueryExpression_execute__SWIG_6(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, contextItem,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context , flags);
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

  public XmlResults execute(XmlTransaction txn, XmlValue contextItem, XmlQueryContext context) throws XmlException {
    long cPtr = dbxml_javaJNI.XmlQueryExpression_execute__SWIG_7(swigCPtr, this, XmlTransaction.getCPtr(txn), txn, contextItem,  context.getManagerPtr(), context.getDebugListenerCPtr(), context.evaluationType, context.queryInterruptSec, context.pack(), context );
    return (cPtr == 0) ? null : new XmlResults(cPtr, true);
  }

}
