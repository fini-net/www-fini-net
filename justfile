import? '.cache/justfile'

# "list" is already used in the parent (default with no args)
local_list:
    just --list

# sync justfile from www-chicks-net
justsync:
    curl --create-dirs -o .cache/justfile https://raw.githubusercontent.com/chicks-net/www-chicks-net/refs/heads/main/justfile

# download justfile again if older than 10 days
justresync:
    #!/usr/bin/env bash
    
    # https://unix.stackexchange.com/a/157108/79839
    # https://stackoverflow.com/a/1401541/2002471 for MacOS `stat` format
    function fileAgeSeconds
    {
        local fileMod
        if fileMod=$(stat -f "%m" -- "$1")
        then
            echo $(( $(date +%s) - $fileMod ))
        else
            return $?
        fi
    }
    
    function fileAgeDays
    {
        local fileSeconds
        fileSeconds=$(fileAgeSeconds "$*")
        echo $(( fileSeconds/60/60/24 ))
    }
    
    
    function resyncJustfile
    {
        local fileDays
        fileDays=$(fileAgeDays .cache/justfile)
    
        if (( fileDays > 10 )); then
            just justsync
        else
            echo ".cache/justfile is new enough that we didn't download a new one"
        fi
    }
    
    resyncJustfile


# convert header from twiki to hugo and turn HTML anchors into Markdown
[no-cd]
fix_twiki_headers:
    #!/usr/bin/env perl

    use strict;
    use warnings;

    our $^I = '.bak';

    while ( my $file = glob '*.txt' ) {
      print "Processing $file\n";

      our @ARGV = ($file);

      while ( <ARGV> ) {
         #tr/a-z/A-Z/;
         # %META:TOPICINFO{author="ChristopherHicks" date="1177432982" format="1.1" version="1.13"}%

         s/^%META:TOPICINFO[{]
           author="(.+?)"
           \s+
           date="(\d+)"
           [ ]
           format="1.1"
           [ ]
           version="([\d.]+)"
           [}]%
          /generate($file,$1,$2,$3)
          /exm;
         #s/<a.*?href="(.*?)".*?>(.*?)<\/a>/[$2]($1)/g; # fix html anchors
         print;
      }
    }

    sub generate {
        my ($file_name, $author, $unixdate, $version) = @_;

        my $iso_date = `TZ=UTC date -r $unixdate -Iseconds`;
        $iso_date =~ s/\s+$//; # strip trailing whitespace

        $file_name =~ s/[.]txt$//; # strip extension

        return <<"END_TEXT";
    <pre>
    +++
    title = '$file_name'
    date = $iso_date
    draft = false
    description = 'Converted from twiki - v$version'
    cover.hidden = true
    #tags = []
    +++
    </pre>
    END_TEXT
        #return "FUNCTION ($author, $date, $version)";
    }

# semi-complete conversion of twiki docs into hugo Markdown
twiki2hugo:
    #!/usr/bin/env bash
    cd content

    just fix_twiki_headers
    rm *.bak

    for src_file in *.txt
    do
        [[ $src_file == "WebImages.txt" ]] && continue # skip brokenness
        dest_file="${src_file%.txt}.md"
        echo $src_file into $dest_file
        pandoc -f twiki -t commonmark $src_file > $dest_file
    done
