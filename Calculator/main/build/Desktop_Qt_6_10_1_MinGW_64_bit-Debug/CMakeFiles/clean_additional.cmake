# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appmain_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appmain_autogen.dir\\ParseCache.txt"
  "appmain_autogen"
  )
endif()
