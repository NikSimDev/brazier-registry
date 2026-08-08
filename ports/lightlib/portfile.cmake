vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO NikSimDev/lightlib
    REF v0.1.5
    SHA512 c1424fe4f612003732390f9a9dd54f5a7e8948038e38be9b8d84292dbd29f02081f49c2a2a7a29998a0ce0bb79311f0b9325f2431624fb6e9bf39864c379e75c
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/Light"
    GENERATOR "Visual Studio 18 2026"
    OPTIONS
        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH share/lightlib)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")