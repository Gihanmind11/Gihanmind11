$ErrorActionPreference = "SilentlyContinue"
$urls = @(
  "https://img.shields.io/github/stars/Gihanmind11?affiliations=OWNER&style=flat",
  "https://github-readme-stats.vercel.app/api?username=Gihanmind11&theme=tokyonight",
  "https://github-readme-stats.vercel.app/api/top-langs?username=Gihanmind11&layout=compact&theme=tokyonight",
  "https://streak-stats.demolab.com/?user=Gihanmind11&theme=tokyonight",
  "https://github-profile-trophy.vercel.app/?username=Gihanmind11&theme=tokyonight",
  "https://github-readme-activity-graph.vercel.app/graph?username=Gihanmind11&theme=tokyo-night"
)
foreach ($u in $urls) {
  try {
    $resp = Invoke-WebRequest -Uri $u -UseBasicParsing -TimeoutSec 25
    $ct = $resp.Headers["Content-Type"]
    if ($ct -is [array]) { $ct = $ct[0] }
    Write-Host "OK  [$($resp.StatusCode)] $ct  $u"
  } catch {
    $msg = $_.Exception.Message
    if ($_.Exception.Response) {
      $sc = [int]$_.Exception.Response.StatusCode
      Write-Host "ERR [$sc] $msg  $u"
    } else {
      Write-Host "FAIL [--] $msg  $u"
    }
  }
}
Write-Host ""
Write-Host "Done checking all URLs."
