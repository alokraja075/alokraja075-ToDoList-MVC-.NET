<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />

</head>
<body>
  <h1>📝 To-Do List Web Application</h1>
  <p>
    A simple and efficient CRUD To-Do List app built with C# .NET Core MVC, containerized with Docker, deployed on AWS EKS, and integrated with SQL Server Integration Services (SSIS) for powerful data workflows.
  </p>
  <blockquote>
    🚀 This project is adapted from an open-source repo and significantly enhanced for production-ready cloud deployment.
  </blockquote>

  <h2>📂 Repository</h2>
  <p>
    Full source code available at:<br />
    <a href="https://github.com/alokraja075/alokraja075-ToDoList-MVC-.NET/blob/master/README.md?plain=1" target="_blank" rel="noopener noreferrer">
      https://github.com/alokraja075/alokraja075-ToDoList-MVC-.NET
    </a>
  </p>

  <h2>🛠️ Table of Contents</h2>
  <ul>
    <li><a href="#prerequisites">Prerequisites</a></li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#docker-support">Docker Support</a></li>
    <li><a href="#deployment-on-aws-eks">Deployment on AWS EKS</a></li>
    <li><a href="#ssis-integration">SSIS Integration</a></li>
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
  </ul>

  <h2 id="getting-started">🚀 Getting Started</h2>
  <ol>
    <li>Clone the repository:
      <pre><code>git clone https://github.com/alokraja075/alokraja075-ToDoList-MVC-.NET.git</code></pre>
    </li>
    <li>Open the project in Visual Studio or your preferred editor</li>
    <li>Update your database connection string in <code>appsettings.json</code></li>
    <li>Run EF Core migrations to set up the database schema:
      <pre><code>dotnet ef migrations add InitialCreate
dotnet ef database update</code></pre>
    </li>
    <li>Run the application locally using Docker Compose:
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
  </ul>

  <h2 id="usage">💻 Usage</h2>
  <p>
    The application runs on port <strong>8080</strong> by default.<br />
    After starting the app with Docker Compose, open your browser and navigate to:<br />
    <a href="http://localhost:8080" target="_blank" rel="noopener noreferrer">http://localhost:8080/</a>
  </p>

  <h2 id="docker-support">🐳 Docker Support</h2>
  <p>To simplify deployment and ensure consistency across environments, the app is containerized with Docker.</p>
  <ul>
    <li>Build and start the app with Docker Compose:
      <pre><code>docker-compose up --build</code></pre>
    </li>
    <li>Access the app at <a href="http://localhost:8080" target="_blank" rel="noopener noreferrer">http://localhost:8080</a></li>
  </ul>

  <h2 id="deployment-on-aws-eks">☁️ Deployment on AWS EKS</h2>
  <p>Use Kubernetes manifests and Helm charts included in this project to deploy on Amazon EKS.</p>
  <ul>
    <li>Configure AWS CLI and kubectl for your cluster</li>
    <li>Deploy the app manifests:
      <pre><code>kubectl apply -f k8s/</code></pre>
    </li>
    <li>Check deployment status:
      <pre><code>kubectl get pods</code></pre>
    </li>
  </ul>

  <h2 id="ssis-integration">🔄 SSIS Integration</h2>
  <p>This project integrates SQL Server Integration Services (SSIS) for advanced ETL workflows, data migration, and automation alongside the application database.</p>

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
