# This module looks for environment variables detailing where G2TMPL lib is
# If variables are not set, G2TMPL will be built from external source
if(DEFINED ENV{G2TMPL_LIBd} )
  set(G2TMPL_LIBd $ENV{G2TMPL_LIBd} CACHE STRING "G2TMPL_d Library Location" )
  set(G2TMPL_INCd $ENV{G2TMPL_INCd} CACHE STRING "G2TMPL_d Include Location" )
else()
  set(G2TMPL_VER 1.5.0)
  find_library( G2TMPL_LIBd
    NAMES libg2tmpl_v${G2TMPL_VER}_d.a
    HINTS
      ${CMAKE_INSTALL_PREFIX}/lib
      ${NCEPLIBS_INSTALL_DIR}/lib
    )
  if(${NCEPLIBS_INSTALL_DIR})
    set(G2TMPL_INCd ${NCEPLIBS_INSTALL_DIR}/include_d CACHE STRING "G2TMPL_d Include Location" )
  else()
    set(G2TMPL_INCd ${CMAKE_INSTALL_PREFIX}/include_d CACHE STRING "G2TMPL_d Include Location" )
  endif()
endif()
