set(SOURCE_PATH "C:/Users/Admin/source/repos/Light")

if(NOT EXISTS "${SOURCE_PATH}")
    message(FATAL_ERROR "Source directory not found: ${SOURCE_PATH}")
endif()

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/Light"   
    OPTIONS
        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
)

vcpkg_cmake_install()

file(REMOVE_RECURSE 
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
)

if(VCPKG_LIBRARY_LINKAGE STREQUAL "static")
    file(REMOVE_RECURSE 
        "${CURRENT_PACKAGES_DIR}/bin"
        "${CURRENT_PACKAGES_DIR}/debug/bin"
    )
endif()

set(VCPKG_POLICY_DLLS_WITHOUT_EXPORTS enabled)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")