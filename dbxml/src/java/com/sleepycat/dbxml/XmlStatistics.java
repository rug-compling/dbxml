/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 1.3.39
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package com.sleepycat.dbxml;

public class XmlStatistics {
  private long swigCPtr;
  protected boolean swigCMemOwn;

  protected XmlStatistics(long cPtr, boolean cMemoryOwn) {
    swigCMemOwn = cMemoryOwn;
    swigCPtr = cPtr;
  }

  protected static long getCPtr(XmlStatistics obj) {
    return (obj == null) ? 0 : obj.swigCPtr;
  }

  public void delete() /* no exception */ {
    if(swigCPtr != 0 && swigCMemOwn) {
	swigCMemOwn = false;
	dbxml_javaJNI.delete_XmlStatistics(swigCPtr);
    }
    swigCPtr = 0;
 }

  public XmlStatistics(XmlStatistics arg0) throws XmlException {
    this(dbxml_javaJNI.new_XmlStatistics(XmlStatistics.getCPtr(arg0), arg0), true);
  }

  public double getNumberOfIndexedKeys() throws XmlException {
    return dbxml_javaJNI.XmlStatistics_getNumberOfIndexedKeys(swigCPtr, this);
  }

  public double getNumberOfUniqueKeys() throws XmlException {
    return dbxml_javaJNI.XmlStatistics_getNumberOfUniqueKeys(swigCPtr, this);
  }

  public double getSumKeyValueSize() throws XmlException {
    return dbxml_javaJNI.XmlStatistics_getSumKeyValueSize(swigCPtr, this);
  }

}