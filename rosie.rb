# Example homebrew formula for Rosie Pattern Language
# https://github.com/jamiejennings/rosie-pattern-language

class Rosie < Formula
  desc "Rosie Pattern Language"
  homepage "https://github.com/jamiejennings/homebrew-rosie"
  url "https://github.com/jamiejennings/rosie-pattern-language.git", :branch => "master"
  version "current"
  sha256 ""

  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    system "make", "BREW=true"
    inreplace "bin/rosie" do |s|
      s.gsub! buildpath, pkgshare
    end
    bin.mkdir
    bin.install "bin/rosie"
    pkgshare.mkpath
    # Required
    pkgshare.install "VERSION"
    pkgshare.install Dir["bin"]
    pkgshare.install Dir["lib"]
    pkgshare.install Dir["src"]
    # Very good to have
    pkgshare.install "MANIFEST"
    pkgshare.install Dir["rpl"]
    pkgshare.install Dir["test"]
    # Informational
    pkgshare.install "CHANGELOG", "LICENSE", "README.md"
    pkgshare.install Dir["doc"]
    pkgshare.install Dir["docker"]
    # Optional
    pkgshare.install Dir["ffi"]
    # Needed to run tests (see below)
    pkgshare.install "Makefile"

    ohai "Rosie installed successfully!"
    ohai "    RPL libraries, documentation, etc are in #{HOMEBREW_PREFIX}/share/rosie"
    ohai "    Executable will be linked (by brew) to #{HOMEBREW_PREFIX}/bin/rosie"
    ohai "    Try this example, and look for color text output: rosie basic.matchall /etc/resolv.conf"

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

    ohai "Note: Use -verbose flag to observe test output"

    system bin/"rosie", "-info"  # Not checking output.  Just a sniff test.
    Dir.chdir(pkgshare)
    system "make", 'HOME=' + pkgshare, 'EXECROSIE=' + bin/"rosie", "test"
  end
end
