$confirmation = Read-Host "Running this script will delete the existing build directory and create a new module from the contents of the data directory. Do you wish to continue?: (Y/N)"

# If confirmed delete old build directory and assemble mod.
if ($confirmation -eq 'y' -or $confirmation -eq 'Y') {
    # Get the scripts current directory
	$script_dir = Split-Path $MyInvocation.MyCommand.Path -Parent

	cd $script_dir
	
	./tools/win/nasher/nasher.exe pack --clean --verbose --erfUtil:"$script_dir/tools/win/neverwinter64/nwn_erf.exe" --gffUtil:"$script_dir/tools/win/neverwinter64/nwn_gff.exe" --tlkUtil:"$script_dir/tools/win/neverwinter64/nwn_tlk.exe" --nssCompiler:"$script_dir/tools/win/nwnsc/nwnsc.exe" --installDir:"$script_dir" --nssFlags:"-n D:\Steam\steamapps\common\NeverwinterNights" --yes
}