# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appGcsVideoStream_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appGcsVideoStream_autogen.dir\\ParseCache.txt"
  "appGcsVideoStream_autogen"
  )
endif()
