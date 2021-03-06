# Default paths for libraries
#
# DO NOT EDIT lib_paths.sed
#   use lib_paths.sed.template
#
# Items that vary frequently that need editing:
#   Berkeley DB major/minor/patch
#   XQilla major/minor/patch
#   Xerces version
#   Python version supported
#   PYBSDDB release number
#   PHP version
#
# Assume dependent libraries are in ../../XXX_HOME, e.g.
#   ../../db-4.8.x
#   ../../xerces-c-src
#   ../../xqilla
#
#
# Windows Tcl paths - just use simple names because this doesn't apply to UNIX
s!@DB_TCLLIB@!../../bin/debug/libdb_tcl@DB_VERSION_MAJOR@@DB_VERSION_MINOR@d.dll!g
s!@DB_TEST_PATH@!@DB_HOME@/test!g
s!@DB_UTIL_PATH@!../../bin/debug!g

# DB_HOME - note that the ordering is important here so that the end result is right
s!@DB_STATIC_LIB@!@DB_LIB@s!g
s!@DB_LIB@!libdb@DB_VERSION_MAJOR@@DB_VERSION_MINOR@!g
s!@DB_DLL@!libdb@DB_VERSION_MAJOR@@DB_VERSION_MINOR@!g
s!@DB_JAVALIB@!libdb_java@DB_VERSION_MAJOR@@DB_VERSION_MINOR@!g
s!@DB_JAVADLL@!libdb_java@DB_VERSION_MAJOR@@DB_VERSION_MINOR@!g
# DB_TCLLIB implies the dll, above
s!@DB_TCL_LIB@!libdb_tcl@DB_VERSION_MAJOR@@DB_VERSION_MINOR@!g
s!@DB_TCL_DLL@!libdb_tcl@DB_VERSION_MAJOR@@DB_VERSION_MINOR@!g
s!@DB_LIBHOME@!@DB_HOME@/build_windows!g
s!@DB_HOME@!../../@DB_NAME@!g
s!@DB_NAME@!db-@DB_VERSION_MAJOR@.@DB_VERSION_MINOR@.@DB_VERSION_PATCH@!g

# DB VERSION: 
s!@DB_VERSION_MAJOR@!4!g
s!@DB_VERSION_MINOR@!8!g
s!@DB_VERSION_PATCH@!26!g

# NOTE: this info must be sync'd with XQilla itself
s!@XQILLA_LIBHOME@!@XQILLA_HOME@/build/windows/vc6/Release!g
s!@XQILLA_LIBHOME_D@!@XQILLA_HOME@/build/windows/vc6/Debug!g
s!@XQILLA_LIBHOME7@!@XQILLA_HOME@/build/windows/vc7.1!g
s!@XQILLA_LIBHOME7_D@!@XQILLA_HOME@/build/windows/vc7.1!g
s!@XQILLA_LIBHOME8_D@!@XQILLA_HOME@/build/windows/VC8!g
s!@XQILLA_LIBHOME8@!@XQILLA_HOME@/build/windows/VC8!g
s!@XQILLA_PROJ@!@XQILLA_HOME@/Win32Projects!g
s!@XQILLA_PROJHOME7@!@XQILLA_HOME@/Win32Projects/VC7.1!g
s!@XQILLA_PROJHOME8@!@XQILLA_HOME@/Win32Projects/VC8!g
s!@XQILLA_STATIC_LIB@!@XQILLA_LIB@s!g
s!@XQILLA_LIB@!xqilla@XQILLA_VERSION_MAJOR@@XQILLA_VERSION_MINOR@!g
s!@XQILLA_DLL@!xqilla@XQILLA_VERSION_MAJOR@@XQILLA_VERSION_MINOR@!g
s!@XQILLA_HOME@!../../@XQILLA_NAME@!g
#s!@XQILLA_NAME@!XQilla-@XQILLA_VERSION_MAJOR@.@XQILLA_VERSION_MINOR@!g
# Simple "xqilla"
s!@XQILLA_NAME@!xqilla!g

s!@XQILLA_VERSION_MAJOR@!2!g
s!@XQILLA_VERSION_MINOR@!2!g
s!@XQILLA_VERSION_PATCH@!3!g

# Xerces is assumed to be source (vs installation)
s!@XERCES_LIBHOME@!@XERCES_WINHOME@/Build/Win32/VC6!g
s!@XERCES_LIBHOME7@!@XERCES_WINHOME@/Build!g
s!@XERCES_LIBHOME8@!@XERCES_WINHOME@/Build!g
s!@XERCES_PROJHOME7@!@XERCES_WINHOME@/Projects/Win32/VC7.1!g
s!@XERCES_PROJHOME8@!@XERCES_WINHOME@/Projects/Win32/VC8!g
s!@XERCES_PROJ@!@XERCES_WINHOME@/Projects/Win32/VC7.1/xerces-all/XercesLib!g
# Xerces-c is in ../../xerces-c-src
s!@XERCES_WINHOME@!../../@XERCES_NAME@!g
s!@XERCES_TAR_NAME@!xerces-c-@XERCES_VERSION_MAJOR@_@XERCES_VERSION_MINOR@_@XERCES_VERSION_PATCH@!g
s!@XERCES_NAME@!xerces-c-src!g
s!@XERCES_UNIXHOME@!/usr/local!g
s!@XERCES_LIB@!xerces-c_@XERCES_VERSION_MAJOR@!g
s!@XERCES_STATIC_LIB@!xerces-c_static_@XERCES_VERSION_MAJOR@!g
s!@XERCES_DLL@!xerces-c_@XERCES_VERSION_MAJOR@_@XERCES_VERSION_MINOR@!g

# Current Xerces version is 3.0
s!@XERCES_VERSION_MAJOR@!3!g
s!@XERCES_VERSION_MINOR@!0!g
s!@XERCES_VERSION_PATCH@!1!g

# Tcl library (change these with new releases/locations).  Will
# have to be changed in projects based on user's machine configuration.
s!@TCLLIB@!tcl84!g
s!@TCL_HOME@!c:/tcl!g

# Python library (change these with new releases/locations).  Will
# have to be changed in projects based on user's machine configuration.
s!@PYLIB@!python25!g
s!@PYREL@!2.5!g
s!@PY_HOME@!c:/python25!g
s!@PYBSDDB_REL@!bsddb3-4.8.1!g

# Install directories (use '\' for Windows commands that may be
# used, such as xcopy)
s!@JAVA_INSTALL@!..\\..\\jar!g
s!@DLL_INSTALL@!..\\..\\bin!g
s!@BIN_INSTALL@!..\\..\\bin!g
s!@LIB_INSTALL@!..\\..\\lib!g

# DBXML names
s!@DBXML_STATIC_LIBNAME@!@DBXML_LIBNAME@s!g
s!@DBXML_LIBNAME@!libdbxml@DBXML_VERSION_MAJOR@@DBXML_VERSION_MINOR@!g
s!@DBXML_TCL_LIBNAME@!libdbxml_tcl@DBXML_VERSION_MAJOR@@DBXML_VERSION_MINOR@!g
s!@DBXML_JAVA_LIBNAME@!libdbxml_java@DBXML_VERSION_MAJOR@@DBXML_VERSION_MINOR@!g
s!@DBXML_PYTHON_LIBNAME@!libdbxml_python@DBXML_VERSION_MAJOR@@DBXML_VERSION_MINOR@!g
s!@DBXML_WINBUILD@!@TOP@/build_windows!g
s!@TOP@!..!g

# NOTE: DBXML_VERSION_* values are set using lib_paths.sed.template,
# processed against the dist/RELEASE file, which holds the
# release numbers.  Do not edit these by hand in lib_paths.sed.
s!@DBXML_VERSION_MAJOR@!2!g
s!@DBXML_VERSION_MINOR@!5!g
s!@DBXML_VERSION_PATCH@!16!g
s!@DBXML_VERSION@!25!g
s!@DBXML_VERSION_STRING@!Oracle: Berkeley DB XML 2.5.16: (December 22, 2009)!g

# the release branch name
s!@DBXML_BRANCH@!dbxml-2_5!g

# PHP -- internal use only
s!@PHP_HOME@!f:/php/php-5.2.5!g
