# 🐢 Coderturtle Blog & Platform

Welcome to **ShellOps** — the secure-by-design, AI-architected platform powering [coderturtle.io](https://coderturtle.io).

> slow is smooth. smooth is fast.

---

## 📝 Blog

All posts live in `/pages/` as Markdown. When merged to `main`, they're auto-built and deployed via GitHub Actions to S3 + CloudFront.

- [How We Terraform](./pages/secure-terraform-setup.md)
- [Blog-as-Code](./pages/how-we-publish-this-blog.md)
- [Architecture Blueprint](./docs/architecture/c4-platform-blueprint.md)

---

## 🧱 Infrastructure

- Astro static site
- GitHub Actions CI/CD
- Terraform modules for:
  - S3 static hosting
  - CloudFront + ACM
  - Route 53 domains
- Hosted at `coderturtle.io`

---

## 📊 Analytics

This site uses **Plausible Analytics** for simple, privacy-first insights.  
Add your domain to [plausible.io](https://plausible.io) and you're live.

---

## 🧭 Developer Dashboard

Visit [dashboard](./pages/dashboard.md) for a summary of:
- Infra readiness
- Design decisions
- AI tooling and docs
- Deployment status

---

## 🤝 Contributing

Pull requests welcome.  
Please see [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

---

## 📄 License

MIT — but turtle wisely.

