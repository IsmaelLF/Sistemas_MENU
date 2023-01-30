#Numero primo
function primo {
    param (
        [int]$num
    )
    if ($num -le 1) {
        return $false
    }
    for ($i = 2; $i -lt $num; $i++) {
        if ($num % $i -eq 0) {
            return $false
        }
    }
    return $true
}

do {
    $numero = Read-Host "Introduce un número (0 para saír):"
    if ($numero -ne 0) {
        if (primo $numero) {
            Write-Host "$numero é primo"
        } else {
            Write-Host "$numero non é primo"
        }
    }
} while ($numero -ne 0)

#Adivinanza
$random = New-Object System.Random
[int]$inferior = Read-Host "Introduce o número inferior: "
[int]$superior = Read-Host "Introduce o número superior: "
$numaleatorio = $random.Next($inferior, $superior)
$contador = 0

do {
    [int]$leer = Read-Host "Adiviña o numero: "
    $contador++
    if (($leer -gt $superior) -or ($leer -lt $inferior)) {
        Write-Host "Numero invalido"
    } elseif ($leer -gt $numaleatorio) {
        Write-Host "O número é inferior ao introducido."
    } elseif($leer -lt $numaleatorio){
        Write-Host "O numero e maior ao introducido"
    }
} until ($leer -eq $numaleatorio)

Write-Host "Gañaches en $contador intentos."
#Lista ordenada
$numeros = @()
do {
    $leernum = Read-Host "Introduce un número (0 para saír):"
    if ($leernum -ne 0) {
        $numeros += $leernum
    }
} while ($leernum -ne 0)
$numeros | Sort-Object