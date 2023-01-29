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
$inferior = Read-Host "Introduce o número inferior: "
$superior = Read-Host "Introduce o número superior: "
$numaleatorio = $random.Next($inferior, $superior)
$contador = 0

do {
    $leer = Read-Host "Adiviña o numero: "
    $contador++
    if ($leer -lt $numaleatorio) {
        Write-Host "O número é maior que o introducido."
    } elseif ($leer -gt $numaleatorio) {
        Write-Host "O número é inferior ao introducido."
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