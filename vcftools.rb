require 'formula'

class Vcftools < Formula
  homepage 'http://vcftools.sourceforge.net/index.html'
  url 'https://downloads.sourceforge.net/project/vcftools/vcftools_0.1.11.tar.gz'
  sha1 '00081e99c0f66316d92ee356580885331cadb46f'

  def install
    system "make", "install", "PREFIX=#{prefix}", "CPP=#{ENV.cxx}"
  end

  def caveats; <<-EOS.undent
    To use the Perl modules, make sure Vcf.pm, VcfStats.pm, and FaSlice.pm
    are included in your PERL5LIB environment variable:
      export PERL5LIB=#{HOMEBREW_PREFIX}/lib/perl5/site_perl:${PERL5LIB}
    EOS
  end

  def test
    system "#{bin}/vcftools"
  end
end
