require_relative '../windows_spec_helper'

context 'File version' do
  {
   'c:\windows\system32\notepad.exe' => '6.1.7600.16385',
   'c:/programdata/chocolatey/choco.exe' =>  '0.9.9.11',
  }.each do |file_path, file_version|
    describe command(<<-EOF
$file_path = '#{file_path}'
if ($file_path -eq '') {
 $file_path = "${env:windir}\\system32\\notepad.exe"
}
try {
  $info = get-item -path $file_path
  write-output ($info.VersionInfo | convertto-json)
} catch [Exception]  { 
  write-output 'Error reading file'
}
EOF
  ) do
      its(:stdout) do
        should match Regexp.new('"FileName":  "' + file_path.gsub(/[()]/,"\\#{$&}").gsub('/','\\').gsub(/\\/,'\\\\\\\\\\\\\\\\') + '"', Regexp::IGNORECASE)
        should match /"ProductVersion":  "#{file_version}"/
      end
    end 
    describe file(file_path.gsub(/[()]/,"\\#{$&}").gsub('/','\\')) do
      it { should be_version(file_version) }
    end
  end 
end
