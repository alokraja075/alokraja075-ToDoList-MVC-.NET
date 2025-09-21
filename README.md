<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
</head>
<body>
  <h1>📝 To-Do List Web Application</h1>
  <p>
    A simple and efficient CRUD To-Do List app built with C# .NET Core MVC, containerized with Docker using a multi-stage build, deployed on AWS EKS, integrated with SQL Server Integration Services (SSIS), and managed with ArgoCD for GitOps-based continuous deployment.
  </p>
  <blockquote>
    🚀 This project is adapted from an open-source repo and enhanced for production-ready cloud deployment and container orchestration.
  </blockquote>

  <h2>📂 Repository</h2>
  <p>
    Full source code available at:<br />
    <a href="https://github.com/alokraja075/alokraja075-ToDoList-MVC-.NET" target="_blank" rel="noopener noreferrer">
      https://github.com/alokraja075/alokraja075-ToDoList-MVC-.NET
    </a>
  </p>

  <h2>🖼️ Screenshot</h2>
  <p>Here's a preview of the application running locally:</p>
  <img src="https://raw.githubusercontent.com/alokraja075/alokraja075-ToDoList-MVC-.NET/main/image.png" alt="To-Do List Application Screenshot" />

  <h2>🛠️ Table of Contents</h2>
  <ul>
    <li><a href="#prerequisites">Prerequisites</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#docker-support">Docker Support</a></li>
    <li><a href="#deployment-on-aws-eks">Deployment on AWS EKS</a></li>
    <li><a href="#argo-cd-deployment">ArgoCD Deployment</a></li>
    <li><a href="#ssis-integration">SSIS Integration</a></li>
    <li><a href="#port-forwarding">Port Forwarding</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
  </ul>

  <h2 id="prerequisites">⚙️ Prerequisites</h2>
  <ul>
    <li>Visual Studio or your favorite IDE</li>
    <li><a href="https://dotnet.microsoft.com/download" target="_blank" rel="noopener noreferrer">.NET Core SDK</a></li>
    <li>A relational database (SQL Server, SQLite, etc.)</li>
    <li><a href="https://www.docker.com/products/docker-desktop" target="_blank" rel="noopener noreferrer">Docker Desktop</a></li>
    <li>AWS CLI and <code>kubectl</code> configured for EKS</li>
    <li>ArgoCD installed and configured (https://argo-cd.readthedocs.io)</li>
  </ul>

  <h2 id="getting-started">🚀 Getting Started</h2>
  <ol>
    <li>Clone the repository:
      <pre><code>git clone https://github.com/alokraja075/alokraja075-ToDoList-MVC-.NET.git</code></pre>
    </li>
    <li>Open the project in Visual Studio or your preferred editor</li>
    <li>Update your database connection string in <code>appsettings.json</code> if needed</li>
    <li>Run EF Core migrations to set up the database schema (optional if using Docker Compose):
      <pre><code>dotnet ef migrations add InitialCreate
dotnet ef database update</code></pre>
    </li>
    <li>Start the app and database with Docker Compose:
      <pre><code>docker-compose up --build</code></pre>
    </li>
  </ol>

  <h2 id="features">✨ Features</h2>
  <ul>
    <li>✅ View all To-Do items</li>
    <li>✏️ Create new To-Do items</li>
    <li>🔍 View item details</li>
    <li>✍️ Edit existing items</li>
    <li>🗑️ Delete items with confirmation</li>
    <li>🚀 Fully containerized with automated database migrations</li>
    <li>🐳 Docker Compose orchestrates app and SQL Server containers with health checks</li>
    <li>☁️ Kubernetes manifests for deployment on AWS EKS</li>
    <li>🔄 SSIS integration for ETL workflows</li>
    <li>⚡ Continuous deployment with ArgoCD</li>
  </ul>

  <h2 id="usage">💻 Usage</h2>
  <p>
    Start the full stack using Docker Compose:
    <pre><code>docker-compose up --build</code></pre>
    Expose the app at <a href="http://localhost:8080" target="_blank">http://localhost:8080</a>.
  </p>
  <p>Stop the stack:</p>
  <pre><code>docker-compose down</code></pre>

  <h2 id="docker-support">🐳 Docker Support</h2>
  <p>
    Multi-stage Dockerfile:
  </p>
  <ul>
    <li>Build stage: Restore dependencies, build, publish app, install EF Core tools.</li>
    <li>Runtime stage: Copy published output, run migrations, start app.</li>
  </ul>
  <p>Docker Compose services:</p>
  <ul>
    <li><code>db</code>: SQL Server 2019 with health checks on port 1433</li>
    <li><code>web</code>: .NET app container on port 8080, waits for healthy DB</li>
  </ul>
  <p>Docker image link: <a href="https://hub.docker.com/r/alokraja075/dissertation-todo" target="_blank">jyoti369/dissertation-todo</a></p>

  <h2 id="deployment-on-aws-eks">☁️ Deployment on AWS EKS</h2>
  <pre><code>kubectl apply -f k8s/</code></pre>
  <p>Check pods and services:</p>
  <pre><code>kubectl get pods
kubectl get svc</code></pre>

  <h2 id="argo-cd-deployment">🚀 ArgoCD Deployment</h2>
  <p>
    Use ArgoCD to manage continuous deployment:
  </p>
  <pre><code>argocd app create dissertation-app \
  --repo https://github.com/alokraja075/alokraja075-ToDoList-MVC-.NET.git \
  --path k8s \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace default
argocd app sync dissertation-app</code></pre>

  <h2 id="port-forwarding">🔌 Port Forwarding</h2>
  <p>
    Forward the service ports to your local machine:
  </p>
  <pre><code>kubectl port-forward svc/todolist-web-service 8080:8080
kubectl port-forward svc/todolist-db-service 1433:1433</code></pre>

  <h2 id="ssis-integration">🔄 SSIS Integration</h2>
  <p>
    Automate ETL workflows and data migrations with SQL Server Integration Services (SSIS).
  </p>

  <h2 id="contributing">🤝 Contributing</h2>
  <ol>
    <li>Fork the repository</li>
    <li>Create a new branch for your feature or fix</li>
    <li>Make your changes and commit with clear messages</li>
    <li>Push to your fork</li>
    <li>Open a pull request against the main repo</li>
  </ol>

  <h2 id="license">📄 License</h2>
  <p>Specify your license here (e.g., MIT License).</p>

  <hr />
  <p>Made with ❤️ by Alok Raja</p>
</body>
</html>
