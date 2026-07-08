<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enterprise DevOps Dashboard | Java Web App</title>
    <!-- FontAwesome for professional icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #0f172a;
            color: #e2e8f0;
            font-family: 'Inter', sans-serif;
        }
        .dashboard-header {
            background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
            border-bottom: 1px solid #334155;
        }
        .status-card {
            background-color: #1e293b;
            border: 1px solid #334155;
            border-radius: 12px;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .status-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            border-color: #38bdf8;
        }
        .badge-online {
            background-color: #065f46;
            color: #34d399;
        }
        .text-neon {
            color: #38bdf8;
        }
        .console-log {
            background-color: #020617;
            font-family: 'Courier New', Courier, monospace;
            border: 1px solid #1e293b;
            color: #34d399;
            max-height: 150px;
            overflow-y: auto;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-dark dashboard-header py-3">
    <div class="container">
        <a class="navbar-brand fw-bold d-flex align-items-center" href="#">
            <i class="fa-solid fa-cubes text-neon me-2 fa-lg"></i>
            <span>CloudOps <span class="text-neon">v2.1</span></span>
        </a>
        <span class="badge badge-online px-3 py-2 rounded-pill fw-semibold">
            <i class="fa-solid fa-circle-check me-1"></i> Cluster: Active
        </span>
    </div>
</nav>

<div class="container my-5">
    <!-- Welcome Row -->
    <div class="row mb-4">
        <div class="col">
            <h2 class="fw-bold">Application Performance Monitoring</h2>
            <p class="text-muted">Real-time metrics rendered dynamically via JavaServer Pages.</p>
        </div>
    </div>

    <!-- Metrics Row -->
    <div class="row g-4 mb-5">
        <!-- Metric 1: Java Runtime -->
        <div class="col-md-4">
            <div class="card status-card h-100 p-4">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h6 class="text-uppercase fw-bold text-muted mb-0">Java Runtime</h6>
                    <i class="fa-brands fa-java text-warning fa-2x"></i>
                </div>
                <h3 class="fw-bold text-white"><%= System.getProperty("java.version") %></h3>
                <p class="text-muted small mb-0">Vendor: <%= System.getProperty("java.vendor") %></p>
            </div>
        </div>

        <!-- Metric 2: Server Memory -->
        <div class="col-md-4">
            <div class="card status-card h-100 p-4">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h6 class="text-uppercase fw-bold text-muted mb-0">JVM Memory Usage</h6>
                    <i class="fa-solid fa-microchip text-neon fa-2x"></i>
                </div>
                <%
                    Runtime runtime = Runtime.getRuntime();
                    long maxMemory = runtime.maxMemory() / (1024 * 1024);
                    long allocatedMemory = runtime.totalMemory() / (1024 * 1024);
                    long freeMemory = runtime.freeMemory() / (1024 * 1024);
                %>
                <h3 class="fw-bold text-white"><%= allocatedMemory - freeMemory %> MB</h3>
                <p class="text-muted small mb-0">Allocated Max: <%= maxMemory %> MB</p>
            </div>
        </div>

        <!-- Metric 3: Host OS -->
        <div class="col-md-4">
            <div class="card status-card h-100 p-4">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h6 class="text-uppercase fw-bold text-muted mb-0">Host Architecture</h6>
                    <i class="fa-solid fa-server text-success fa-2x"></i>
                </div>
                <h3 class="fw-bold text-white text-truncate"><%= System.getProperty("os.name") %></h3>
                <p class="text-muted small mb-0">Arch: <%= System.getProperty("os.arch") %></p>
            </div>
        </div>
    </div>

    <!-- Tech Stack & Deployment Simulation -->
    <div class="row g-4">
        <!-- Deployment Pipeline Info -->
        <div class="col-lg-7">
            <div class="card status-card p-4 h-100">
                <h5 class="fw-bold text-white mb-4"><i class="fa-solid fa-timeline text-neon me-2"></i>Deployment Pipeline Logs</h5>
                <div class="p-3 rounded console-log mb-3">
                    [INFO] Building war: /target/maven-web-app.war <br>
                    [INFO] Webapp assembled in [241 msecs] <br>
                    [INFO] Packaging Layer: Successfully built Docker Image <br>
                    [INFO] Kubernetes: Applying deployment manifests... <br>
                    [SUCCESS] Pods running on live cluster.
                </div>
                <div class="text-muted small">
                    <i class="fa-solid fa-clock me-1"></i> Containerized Session Initialized: <strong><%= new java.util.Date() %></strong>
                </div>
            </div>
        </div>

        <!-- Tech Badges -->
        <div class="col-lg-5">
            <div class="card status-card p-4 h-100">
                <h5 class="fw-bold text-white mb-3"><i class="fa-solid fa-layer-group text-neon me-2"></i>Target Architecture</h5>
                <p class="text-muted small">This web application is configured for modern CI/CD automation.</p>
                <div class="d-flex flex-wrap gap-2 mt-2">
                    <span class="badge bg-dark border border-secondary p-2"><i class="fa-brands fa-java text-warning me-1"></i> Java JSP</span>
                    <span class="badge bg-dark border border-secondary p-2"><i class="fa-solid fa-feather text-danger me-1"></i> Maven Build</span>
                    <span class="badge bg-dark border border-secondary p-2"><i class="fa-brands fa-docker text-primary me-1"></i> Dockerized</span>
                    <span class="badge bg-dark border border-secondary p-2"><i class="fa-solid fa-dharmachakra text-info me-1"></i> Kubernetes</span>
                    <span class="badge bg-dark border border-secondary p-2"><i class="fa-brands fa-jenkins text-light me-1"></i> Jenkins CI/CD</span>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="container text-center py-4 text-muted border-top border-secondary mt-5 small">
    &copy; <%= java.time.Year.now().getValue() %> CloudOps Architecture Project. Built with Maven.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
