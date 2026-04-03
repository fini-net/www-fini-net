import? '.just/gh-process.just'
import? '.just/template-sync.just'
import? '.just/repo-toml.just'
import? '.just/pr-hook.just'
import? '.just/cue-verify.just'
import? '.just/copilot.just'
import? '.just/claude.just'
import? '.just/shellcheck.just'

# "list" is already used in the parent (default with no args)
[group('Local')]
local_list:
    just --list

# convert header from twiki to hugo and turn HTML anchors into Markdown
[no-cd]
[group('Hugo_Convert')]
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
[group('Hugo_Convert')]
twiki2hugo:
    #!/usr/bin/env bash
    cd content || echo "cd failed" && exit 3

    just fix_twiki_headers
    rm ./*.bak

    for src_file in *.txt
    do
        [[ $src_file == "WebImages.txt" ]] && continue # skip brokenness
        dest_file="${src_file%.txt}.md"
        echo "$src_file into $dest_file"
        pandoc -f twiki -t commonmark "$src_file" > "$dest_file"
    done
