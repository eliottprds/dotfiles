```markdown
# R405 TP1 - Eliott PARADIS

## Exercice 1. Je me méfie des apparences (types d’objets)
### Script ex1.ps1
```powershell
$name = Read-Host -Prompt "Enter your name"
[int32]$birthYear = Read-Host -Prompt "Hello $name, what is your birth year?"
[int32]$age = Read-Host -Prompt "How old will you be at your next birthday?"
$currentYear = $birthYear + $age
Write-Host "Current year is $currentYear"
```
Ce script collecte le nom, l'année de naissance et l'âge futur de l'utilisateur, puis calcule l'année actuelle.

---

## Exercice 2. J’utilise les méthodes des objets
### Script ex2.ps1
```powershell
[string]$text = "Coder en Powershell c'est simple"
Write-Host "Text length: $($text.Length)"
Write-Host "---"
$text.ToCharArray() | ForEach-Object { Write-Host $_ }
Write-Host "---"
Write-Host "First 'P' Index: $($text.IndexOf('P'))"
Write-Host "---"
Write-Host "With i instead of e: $($text.Replace('e','i'))"
Write-Host "---"
Write-Host "Last 'p' Index: $($text.LastIndexOf('p'))"
Write-Host "---"
Write-Host "Split by spaces: $($text.Split(' '))"
Write-Host "---"
Write-Host "Substring from index 2 (5 chars): $($text.Substring(2,5))"
```
Manipule une chaîne pour afficher sa longueur, ses caractères, des remplacements, et des sous-parties.

---

## Exercice 3. Manipulation d’un objet complexe (date)
### Script ex3.ps1
```powershell
$date = Get-Date
Write-Host "Current date: $($date.ToString('dd/MM/yyyy'))"
Write-Host "Current time: $($date.ToString('HH:mm:ss'))"
Write-Host "Date in 5 days: $($date.AddDays(5).ToString('dddd d MMMM yyyy'))"
Write-Host "Date in 1 month: $($date.AddMonths(1).ToString('dddd d MMMM yyyy'))"
Write-Host "Date 10 days ago: $($date.AddDays(-10).ToString('dd/MM/yyyy'))"
```
Affiche la date actuelle et des variations temporelles avec des formats spécifiques.

---

## Exercice 4. Formater une date dans la langue locale
### Script ex4.ps1
```powershell
$date = Get-Date
Write-Host "Jour de la semaine: $($date.ToString('dddd', [System.Globalization.CultureInfo]::GetCultureInfo('fr-FR')))"
Write-Host "En abrégé: $($date.ToString('ddd', [System.Globalization.CultureInfo]::GetCultureInfo('fr-FR')))"
Write-Host "Mois: $($date.ToString('MMMM', [System.Globalization.CultureInfo]::GetCultureInfo('fr-FR')))"
Write-Host "En abrégé: $($date.ToString('MMM', [System.Globalization.CultureInfo]::GetCultureInfo('fr-FR')))"
```
Utilise des formats de localisation française pour afficher les éléments de date.

---

## Exercice 5. Conversion de chaîne en DateTime
### Script ex5.ps1
```powershell
$inputDate = Read-Host -Prompt "Enter a date"
$convertedDate = [System.DateTime]::Parse($inputDate)
Write-Host "Converted date: $convertedDate"
```
Convertit une chaîne saisie en objet DateTime avec gestion implicite des formats.

---

## Exercice 6. Gestion des erreurs de conversion
### Script ex6.ps1
```powershell
try {
    $inputDate = Read-Host -Prompt "Enter a date"
    $convertedDate = [System.DateTime]::Parse($inputDate)
    Write-Host "Valid date: $convertedDate"
}
catch {
    Write-Host "Error! Valid formats: 2/5/2019 or 3 mars 2015"
}
```
Ajoute une gestion d'erreur pour les formats de date invalides.

---

## Exercice 7. Récupération des processus
### Script ex7.ps1
```powershell
Get-Process | Select-Object ProcessName, StartTime, CPU
```
Liste les processus avec leur nom, heure de démarrage et utilisation CPU.

---

## Exercice 8. Filtrage des processus gourmands
### Script ex8.ps1
```powershell
Get-Process | Where-Object { $_.CPU -gt 10 }
```
Filtre les processus ayant utilisé plus de 10 secondes de CPU.

---

## Exercice 9. Tri des processus par CPU
### Script ex9.ps1
```powershell
Get-Process | Sort-Object CPU -Descending
```
Trie les processus du plus au moins consommateur de CPU.

---

## Exercice 10. Limitation aux 10 premiers
### Script ex10.ps1
```powershell
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
```
Affiche les 10 processus les plus gourmands en CPU.

---

## Exercice 11. Sauvegarde dans un fichier
### Script ex11.ps1
```powershell
$process = Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
$process | Out-File -FilePath "process.txt"
```
Exporte le résultat dans un fichier texte.

---

## Exercice 12. Ports TCP en écoute
### Script ex12.ps1
```powershell
Get-NetTCPConnection | Where-Object { $_.State -eq "Listen" }
```
Liste les ports TCP en état d'écoute.

---

## Exercice 13. Processus externes
### Script ex13.ps1
```powershell
Get-Process -IncludeUserName | Where-Object { $_.UserName -ne $env:USERNAME }
```
Identifier les processus démarrés par d'autres utilisateurs.
```