#! /usr/bin/perl

# LENLS proceedingsの掲載ページ数を計算するスクリプト

$tmp = 'tmp.tex';

open(TMP,"> $tmp") || die("Can't open file: $tmp\n");

$frompage = 0; # 前の論文の終了ページ
$topage = 0;     # この論文の終了ページ

while(<>){
  if(/(\s+)(page(\d+))/){
    if($2 == 0){
      print TMP $1,"{}\n";
      } elsif($2 == 1){
      $frompage = $topage + 1;
      $topage = $topage + $2;
      print TMP $1,"{",$frompage,"}\n";
      } else{
      $frompage = $topage + 1;
      $topage = $topage + $2;
      print TMP $1,"{",$frompage,"--",$topage,"}\n";
      }
    }
  else{
    print TMP $_;
    }
  }
close(TMP);

open(TMP,"< $tmp") || die("Can't open file: $tmp\n");

while(<TMP>){
  print;
  }

close(TMP);
exit;

