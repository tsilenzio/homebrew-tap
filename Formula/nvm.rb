class Nvm < Formula
  desc "Stand-in for Homebrew's nvm that loads whatever nvm is in $NVM_DIR"
  homepage "https://github.com/tsilenzio/nvmimic"
  url "https://github.com/tsilenzio/nvmimic/releases/download/v1.0.1/nvmimic-darwin-universal.tar.gz"
  sha256 "6a1326b0f279fb378d3640e221def270d69ac1a3bf583dde91156c526c76ef8e"
  license "MIT"

  def install
    (prefix/"nvm.sh").write <<~'SH'
      # nvm stand-in from tsilenzio/tap, the Homebrew formula named nvm.
      #
      # It sits where Homebrew's own nvm keeps nvm.sh, so a startup file that
      # loads Homebrew's nvm keeps working after that nvm is gone. It loads
      # whatever nvm is in $NVM_DIR: nvmimic, nvmise or official nvm.
      #
      # MIT licensed: Copyright (c) 2026 Taylor Silenzio.

      if [ -z "${NVM_DIR-}" ]; then
        export NVM_DIR="$HOME/.nvm"
      fi
      # dash gives a sourced file no arguments of its own, so there nvm.sh sees
      # the caller's.
      # shellcheck disable=SC1091,SC2240
      if [ -s "$NVM_DIR/nvm.sh" ]; then
        \. "$NVM_DIR/nvm.sh" ${1+"$@"}
      else
        command printf 'nvm: there is no nvm.sh in %s, so nvm was not loaded.\n' "$NVM_DIR" >&2
        false
      fi
    SH
    (bash_completion/"nvm").write <<~'SH'
      # nvm stand-in from tsilenzio/tap, the Homebrew formula named nvm.
      #
      # It sits where Homebrew's own nvm keeps its bash completion, and loads the
      # completion of whatever nvm is in $NVM_DIR.
      #
      # MIT licensed: Copyright (c) 2026 Taylor Silenzio.

      # shellcheck disable=SC1091
      if [ -s "${NVM_DIR:-$HOME/.nvm}/bash_completion" ]; then
        \. "${NVM_DIR:-$HOME/.nvm}/bash_completion"
      fi
    SH
  end

  def caveats
    <<~EOS
      This nvm is a stand-in from nvmimic. It loads whatever nvm is in
      $NVM_DIR, so startup files that load #{opt_prefix}/nvm.sh keep
      working with nvmimic, nvmise or official nvm.
    EOS
  end

  test do
    (testpath/"nvm").mkpath
    (testpath/"nvm/nvm.sh").write "echo \"loaded $1\"\n"
    output = shell_output("NVM_DIR=#{testpath}/nvm bash -c '. #{prefix}/nvm.sh --no-use'")
    assert_equal "loaded --no-use", output.strip
  end
end
