const APP_ROOT = "/Blendique";

function getPageURL(path) {
    return APP_ROOT + "/" + path;
}


async function loadPartial(containerId, filePath) {
    const container = document.getElementById(containerId);

    if (!container) return;

    try {
        const response = await fetch(filePath);

        if (!response.ok) {
            throw new Error(filePath + " could not be loaded");
        }

        container.innerHTML = await response.text();

    } catch (error) {
        console.error("Layout loading error:", error);
    }
}

async function loadLayout() {
    await Promise.all([
        loadPartial("shared-header", "../header.html"),
        loadPartial("shared-footer", "../footer.html")
    ]);
}

document.addEventListener("DOMContentLoaded", loadLayout);
