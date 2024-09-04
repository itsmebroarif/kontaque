#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define project directories and files
ROOT_DIR="$PWD"
ASSETS_DIR="$ROOT_DIR/assets"
JS_DIR="$ROOT_DIR/js"
CSS_DIR="$ROOT_DIR/css"
PAGES_DIR="$ROOT_DIR/pages"
PDF_DIR="$ASSETS_DIR/pdf"
IMG_DIR="$ASSETS_DIR/img"
PICTURE_DIR="$ASSETS_DIR/picture"

# Create project directory structure
echo "Creating project directory structure..."
mkdir -p "$JS_DIR"
mkdir -p "$CSS_DIR"
mkdir -p "$PAGES_DIR"
mkdir -p "$PDF_DIR"
mkdir -p "$IMG_DIR"
mkdir -p "$PICTURE_DIR"

# Create and populate index.html
echo "Creating index.html..."
cat <<EOL > "$ROOT_DIR/index.html"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="node_modules/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="node_modules/aos/dist/aos.css">
</head>
<body>
    <div class="container">
        <h1>Welcome to My Project</h1>
    </div>

    <script src="node_modules/jquery/dist/jquery.min.js"></script>
    <script src="node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="node_modules/sweetalert2/dist/sweetalert2.all.min.js"></script>
    <script src="node_modules/chart.js/dist/chart.min.js"></script>
    <script src="node_modules/aos/dist/aos.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
EOL

# Create and populate js/script.js
echo "Creating js/script.js..."
cat <<EOL > "$JS_DIR/script.js"
document.addEventListener("DOMContentLoaded", function () {
    Swal.fire({
        title: 'Welcome!',
        text: 'This is a SweetAlert2 welcome alert.',
        icon: 'info',
        confirmButtonText: 'Okay'
    });
});
EOL

# Create and populate css/style.css
echo "Creating css/style.css..."
cat <<EOL > "$CSS_DIR/style.css"
body {
    padding-top: 20px;
}
EOL

# Create additional pages
echo "Creating additional pages..."
cat <<EOL > "$PAGES_DIR/about.html"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>About Us</h1>
        <p>This is the about page.</p>
    </div>
    <script src="../node_modules/jquery/dist/jquery.min.js"></script>
    <script src="../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
EOL

cat <<EOL > "$PAGES_DIR/features.html"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Features</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Features</h1>
        <p>This is the features page.</p>
    </div>
    <script src="../node_modules/jquery/dist/jquery.min.js"></script>
    <script src="../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
EOL

cat <<EOL > "$PAGES_DIR/contact.html"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../node_modules/bootstrap/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Contact Us</h1>
        <p>This is the contact page.</p>
    </div>
    <script src="../node_modules/jquery/dist/jquery.min.js"></script>
    <script src="../node_modules/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
EOL

# Install npm dependencies
echo "Installing npm dependencies..."
npm init -y
npm install bootstrap sweetalert2 chart.js aos

echo "Project setup is complete, Enjoy!"
