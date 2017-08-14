dnl $Id$
dnl config.m4 for extension group_apm

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

dnl PHP_ARG_WITH(group_apm, for group_apm support,
dnl Make sure that the comment is aligned:
dnl [  --with-group_apm             Include group_apm support])

dnl Otherwise use enable:

PHP_ARG_ENABLE(group_apm, whether to enable group_apm support,
Make sure that the comment is aligned:
[  --enable-group_apm           Enable group_apm support])

if test "$PHP_GROUP_APM" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-group_apm -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/group_apm.h"  # you most likely want to change this
  dnl if test -r $PHP_GROUP_APM/$SEARCH_FOR; then # path given as parameter
  dnl   GROUP_APM_DIR=$PHP_GROUP_APM
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for group_apm files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       GROUP_APM_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$GROUP_APM_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the group_apm distribution])
  dnl fi

  dnl # --with-group_apm -> add include path
  dnl PHP_ADD_INCLUDE($GROUP_APM_DIR/include)

  dnl # --with-group_apm -> check for lib and symbol presence
  dnl LIBNAME=group_apm # you may want to change this
  dnl LIBSYMBOL=group_apm # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $GROUP_APM_DIR/$PHP_LIBDIR, GROUP_APM_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_GROUP_APMLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong group_apm lib version or lib not found])
  dnl ],[
  dnl   -L$GROUP_APM_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(GROUP_APM_SHARED_LIBADD)

  PHP_NEW_EXTENSION(group_apm, group_apm.c, $ext_shared)
fi
