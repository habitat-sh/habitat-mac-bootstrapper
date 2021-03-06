#
# Copyright 2016 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "coreutils"
default_version "8.30"

version("8.30") { source md5: "ab06d68949758971fe744db66b572816" }

dependency "xz"

license "GPL-3.0"
license_file "COPYING"

source url: "http://ftp.gnu.org/gnu/coreutils/coreutils-#{version}.tar.xz"

relative_path "coreutils-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  configure_command = [
    "./configure",
    "--prefix=#{install_dir}/embedded",
  ]

  command configure_command.join(" "), env: env
  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
