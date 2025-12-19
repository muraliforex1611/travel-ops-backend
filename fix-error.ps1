# =====================================================================
# FIX SCRIPT - Travel Operations Backend
# =====================================================================
# This script fixes the TypeScript configuration error
# Run this in PowerShell or Git Bash
# =====================================================================

Write-Host "🔧 Fixing TypeScript Configuration Error..." -ForegroundColor Yellow
Write-Host ""

# Check if we're in the correct directory
if (-not (Test-Path "package.json")) {
    Write-Host "❌ Error: package.json not found!" -ForegroundColor Red
    Write-Host "   Please run this script from the project root directory" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Found package.json" -ForegroundColor Green

# Create tsconfig.json if missing
if (-not (Test-Path "tsconfig.json")) {
    Write-Host "📝 Creating tsconfig.json..." -ForegroundColor Yellow
    
    $tsconfigContent = @"
{
  "compilerOptions": {
    "module": "commonjs",
    "declaration": true,
    "removeComments": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "allowSyntheticDefaultImports": true,
    "target": "ES2021",
    "sourceMap": true,
    "outDir": "./dist",
    "baseUrl": "./",
    "rootDir": "./src",
    "incremental": true,
    "skipLibCheck": true,
    "strictNullChecks": false,
    "noImplicitAny": false,
    "strictBindCallApply": false,
    "forceConsistentCasingInFileNames": false,
    "noFallthroughCasesInSwitch": false,
    "esModuleInterop": true,
    "resolveJsonModule": true,
    "paths": {
      "@/*": ["src/*"],
      "@modules/*": ["src/modules/*"],
      "@common/*": ["src/common/*"],
      "@config/*": ["src/config/*"]
    }
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist", "test", "**/*spec.ts"]
}
"@
    
    $tsconfigContent | Out-File -FilePath "tsconfig.json" -Encoding UTF8
    Write-Host "✅ tsconfig.json created" -ForegroundColor Green
} else {
    Write-Host "✅ tsconfig.json already exists" -ForegroundColor Green
}

# Create nest-cli.json if missing
if (-not (Test-Path "nest-cli.json")) {
    Write-Host "📝 Creating nest-cli.json..." -ForegroundColor Yellow
    
    $nestCliContent = @"
{
  "`$schema": "https://json.schemastore.org/nest-cli",
  "collection": "@nestjs/schematics",
  "sourceRoot": "src",
  "compilerOptions": {
    "deleteOutDir": true,
    "webpack": false,
    "tsConfigPath": "tsconfig.json"
  }
}
"@
    
    $nestCliContent | Out-File -FilePath "nest-cli.json" -Encoding UTF8
    Write-Host "✅ nest-cli.json created" -ForegroundColor Green
} else {
    Write-Host "✅ nest-cli.json already exists" -ForegroundColor Green
}

# Create src directory structure if missing
if (-not (Test-Path "src")) {
    Write-Host "📁 Creating src directory structure..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path "src" -Force | Out-Null
    New-Item -ItemType Directory -Path "src/modules" -Force | Out-Null
    New-Item -ItemType Directory -Path "src/common" -Force | Out-Null
    New-Item -ItemType Directory -Path "src/config" -Force | Out-Null
    Write-Host "✅ Directory structure created" -ForegroundColor Green
} else {
    Write-Host "✅ src directory exists" -ForegroundColor Green
}

# Check if main.ts exists
if (-not (Test-Path "src/main.ts")) {
    Write-Host "⚠️  Warning: src/main.ts not found" -ForegroundColor Yellow
    Write-Host "   Please ensure you have extracted all project files" -ForegroundColor Yellow
}

# Check if app.module.ts exists
if (-not (Test-Path "src/app.module.ts")) {
    Write-Host "⚠️  Warning: src/app.module.ts not found" -ForegroundColor Yellow
    Write-Host "   Please ensure you have extracted all project files" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎉 ============================================" -ForegroundColor Green
Write-Host "   Fix Complete!" -ForegroundColor Green
Write-Host "   ============================================" -ForegroundColor Green
Write-Host ""
Write-Host "🚀 Next steps:" -ForegroundColor Cyan
Write-Host "   1. Run: npm run start:dev" -ForegroundColor White
Write-Host "   2. If error persists, run: npm install" -ForegroundColor White
Write-Host "   3. Then try again: npm run start:dev" -ForegroundColor White
Write-Host ""
