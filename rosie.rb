# Example homebrew formula for Rosie Pattern Language
# https://github.com/jamiejennings/rosie-pattern-language

class Rosie < Formula
  desc "Rosie Pattern Language"
  homepage "http://rosie-lang.org"
#  url "https://github.com/jamiejennings/rosie-pattern-language.git", :tag => "v1.0.0-beta-1"
  url "https://github.com/jamiejennings/rosie-pattern-language.git", :branch => "beta2"
  version "current"
  sha256 ""

  depends_on :xcode => :build

  def install
    ENV.deparallelize
    system "make", "BREW=true"
    system "make", "install", "DESTDIR="+prefix
    ohai "Rosie installed successfully!"
    ohai "    RPL libraries, documentation, etc are in #{HOMEBREW_PREFIX}/lib/rosie"
    ohai "    Executable will be linked (by brew) to #{HOMEBREW_PREFIX}/bin/rosie"
    ohai "    Try this example, and look for color text output: rosie match all.things #{HOMEBREW_PREFIX}/README"

  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # testcmd = "'dofile(\"" + pkgshare + "/test/all.lua\")'"
    # testcmd = "'print(1); os.exit()'"
    # foo = '"echo ' + testcmd + ' | ' + bin + '/rosie -D"'
    # system "/usr/bin/env", "bash", "-c", foo

#     ohai "Note: Use -verbose flag to observe test output"

    system bin/"rosie", "config"  # Not checking output.  Just a sniff test.
#     Dir.chdir(pkgshare)
#     system "make", 'HOME=' + pkgshare, 'EXECROSIE=' + bin/"rosie", "test"
  end
end
