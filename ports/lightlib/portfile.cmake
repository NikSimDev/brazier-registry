vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO NikSimDev/lightlib
    REF v0.1.6
    SHA512 92e7c2bfe0c4c6881fe49e1bef718c39428004dadf3529b36d7a2b24bbbfd377bdf0fd7312a7dcf4472e35c129af15f53a270a00ac0376a8983f1bbb647f2504
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/Light"
    GENERATOR "Visual Studio 18 2026"
    OPTIONS
        -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}
)

vcpkg_cmake_install()

file(REMOVE_RECURSE 
    "${CURRENT_PACKAGES_DIR}/debug/include"
)

set(VCPKG_POLICY_DLLS_WITHOUT_EXPORTS enabled)

vcpkg_cmake_config_fixup(CONFIG_PATH share/lightlib)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")