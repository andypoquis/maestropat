//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_native_html_to_pdf/flutter_native_html_to_pdf_plugin.h>
#include <url_launcher_linux/url_launcher_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flutter_native_html_to_pdf_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterNativeHtmlToPdfPlugin");
  flutter_native_html_to_pdf_plugin_register_with_registrar(flutter_native_html_to_pdf_registrar);
  g_autoptr(FlPluginRegistrar) url_launcher_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "UrlLauncherPlugin");
  url_launcher_plugin_register_with_registrar(url_launcher_linux_registrar);
}
