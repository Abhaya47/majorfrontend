//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_selector_linux/file_selector_plugin.h>
<<<<<<< HEAD
#include <flutter_secure_storage_linux/flutter_secure_storage_linux_plugin.h>
//=======
//#include <flutter_secure_storage/flutter_secure_storage_plugin.h>
//>>>>>>> origin/main

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) file_selector_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FileSelectorPlugin");
  file_selector_plugin_register_with_registrar(file_selector_linux_registrar);
//<<<<<<< HEAD
  g_autoptr(FlPluginRegistrar) flutter_secure_storage_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterSecureStorageLinuxPlugin");
  flutter_secure_storage_linux_plugin_register_with_registrar(flutter_secure_storage_linux_registrar);
//=======
  //g_autoptr(FlPluginRegistrar) flutter_secure_storage_registrar =
    //  fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterSecureStoragePlugin");
  //flutter_secure_storage_plugin_register_with_registrar(flutter_secure_storage_registrar);
//>>>>>>> origin/main
}