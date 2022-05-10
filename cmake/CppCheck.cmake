## suppress uninitMemberVar 警告，不然依赖的库会报这个

function(AddCppCheck target)
  find_program(CPPCHECK_PATH cppcheck REQUIRED)
  set_target_properties(${target}
    PROPERTIES CXX_CPPCHECK
    "${CPPCHECK_PATH};--enable=warning;--suppress=uninitMemberVar;--error-exitcode=10"
  )
endfunction()
