#
#
#
class galaxy::naturalis_scripts(
    $galaxy_path = '/opt/galaxy',
    $base_path   = '/opt/naturalis-scripts',
    $bin_path    = '/usr/local/bin'
  ){
  #https://github.com/Y-Lammers/BLAST_wrapper
  ensure_packages(['python-pip'])
  Vcsrepo {
    ensure   => present,
    provider => git,
    require  => File[$base_path],
  }

  File {
    ensure => link,
  }

  file {$base_path:
    ensure => directory
  }

  #https://github.com/Y-Lammers/BLAST_wrapper
  vcsrepo {"${base_path}/BLAST_wrapper" : source => 'https://github.com/Y-Lammers/BLAST_wrapper' }
  file {"${bin_path}/BLAST_wrapper" : target => "${base_path}/BLAST_wrapper/BLAST_wrapper.py" }

  #https://github.com/Y-Lammers/Add_taxonomy
  vcsrepo {"${base_path}/Add_taxonomy" : source => 'https://github.com/Y-Lammers/Add_taxonomy' }
  file {"${bin_path}/Add_taxonomy" : target => "${base_path}/Add_taxonomy/Add_taxonomy.py" }

  #https://github.com/naturalis/HTS-barcode-checker
  exec { '/usr/bin/pip install install beautifulsoup4': }
  vcsrepo {"${base_path}/HTS-barcode-checker" : source => 'https://github.com/Y-Lammers/HTS-barcode-checker' }
  file {"${bin_path}/HTS-barcode-checker" : target => "${base_path}/HTS-barcode-checker/HTS-barcode-checker.py" }
  file {"${galaxy_path}/tools/HTS-barcode-checker.py" : target => "${base_path}/HTS-barcode-checker/scr/HTS-barcode-checker.py" }
  file {"${galaxy_path}/tools/HTS-barcode-checker.xml" : target => "${base_path}/HTS-barcode-checker/scr/HTS-barcode-checker.xml" }

  #https://github.com/Y-Lammers/Abundance_Filter
  vcsrepo {"${base_path}/Abundance_Filter" : source => 'https://github.com/Y-Lammers/Abundance_Filter' }
  file {"${bin_path}/Abundance_Filter" : target => "${base_path}/Abundance_Filter/Abundance_Filter.py" }

  #https://github.com/Y-Lammers/CD-HIT-Filter
  vcsrepo {"${base_path}/CD-HIT-Filter" : source => 'https://github.com/Y-Lammers/CD-HIT-Filter' }
  file {"${bin_path}/CD-HIT-Filter" : target => "${base_path}/CD-HIT-Filter/CD-HIT-Filter.py" }

  #https://github.com/Y-Lammers/Compare_BLAST
  vcsrepo {"${base_path}/Compare_BLAST" : source => 'https://github.com/Y-Lammers/Compare_BLAST' }
  file {"${bin_path}/Compare_BLAST" : target => "${base_path}/Compare_BLAST/Compare_BLAST.py" }

  #https://github.com/Y-Lammers/Resize_nonChimera
  vcsrepo {"${base_path}/Resize_nonChimera" : source => 'https://github.com/Y-Lammers/Resize_nonChimera' }
  file {"${bin_path}/Resize_nonChimera" : target => "${base_path}/Resize_nonChimera/Resize_nonChimera.py" }

  #https://github.com/naturalis/Split_on_Primer (py in /src)
  vcsrepo {"${base_path}/Split_on_Primer" : source => 'https://github.com/naturalis/Split_on_Primer' }
  file {"${bin_path}/Split_on_Primer" : target => "${base_path}/Split_on_Primer/src/Split_on_Primer.py" }

  #https://github.com/Y-Lammers/Expand_BLAST
  vcsrepo {"${base_path}/Expand_BLAST" : source => 'https://github.com/Y-Lammers/Expand_BLAST' }
  file {"${bin_path}/Expand_BLAST" : target => "${base_path}/Expand_BLAST/Expand_BLAST.py" }


}
