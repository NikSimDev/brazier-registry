vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO NikSimDev/lightlib
    REF v0.1.4
    SHA512 cde4708a579a0e9c5565c6db333f9c44d6a28ba4c36e1b26f2d63927e42df6067bd5068332338b43f34aa305a0c0cc7f9af74ef5a395959856da114dfaf9ce8e
    HEAD_REF master
)

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