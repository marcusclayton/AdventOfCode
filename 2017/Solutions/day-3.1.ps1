<#
65  64  63  62  61  60  59  58  57
66  37  36  35  34  33  32  31  56
67  38  17  16  15  14  13  30  55
68  39  18   5   4   3  12  29  54
69  40  19   6   1   2  11  28  53
70  41  20   7   8   9  10  27  52
71  42  21  22  23  24  25  26  51
72  43  44  45  46  47  48  49  50
73  74  75  76  77  78  79  80  81

17  16  15  14  13
18   5   4   3  12
19   6   1   2  11
20   7   8   9  10
21  22  23  24  25
#>

$my = 347991
$i = 1
$squared = 0
$ring = 1
$squares = @()

while($squared -lt $my){
    #"i is $i"
    $squared = $i*$i
   # "squared is $squared"
    if($squared % 2 -ne 0){
        #"$squared not divisible by 2"
        $squares += $i*$i
        #"Squares is now $($squares -join ',')"
    } else{
       # "$squared is divisible by 2"
    }
    $i++
    $i++

}

$ring = $squares.Count -1
$nums = $squares[-1]..$($squares[-2] + 1 )
$count = $nums.Count

$positions = @{
    0 = @($ring,-$ring)
    1 = @(-$ring,-$ring)
    2 = @(-$ring,$ring)
    3 = @($ring,$ring)
}

$side = 0
$i = $i -2
$index=$null

:breakToHere while($index -lt 0){
    $increment = $i - 1
    $x = $nums | select -First $increment -Skip ($increment*$side)
    $index = $x.IndexOf($my)
    if($index -ge 0){ break failToHere }
    $side++

}

$start = $positions[$side]
#"Start: $start"

switch ($side){

   0 {
        $position = @($($start[0] - $index) , $start[-1] )

        Break
    }
    1 {
        $position = @($start[0] , $( $start[-1] + $index ) )

        Break
   }

   2 {
        $position = @( $($start[0] + $index) , $start[-1] )
        Break
    }

    3 {
        $position = @($start[0] , $( $start[-1] - $index ) )

        Break
    }

}

$position

$hops = [math]::abs( $position[0] ) + [math]::abs( $position[1] )
"Hops: $hops"