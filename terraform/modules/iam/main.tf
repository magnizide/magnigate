resource "google_service_account" "instance_sa" {
  account_id   = "${var.service_name}-${terraform.workspace}-sa"
  display_name = "${title(var.service_name)} Storage Reader Service Account"
}

resource "google_project_iam_member" "instance_sa_bucket_access" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.instance_sa.email}"
}

resource "google_storage_bucket_iam_binding" "instance_sa_conditional_access" {
  bucket = var.bucket_name
  role   = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${google_service_account.instance_sa.email}",
  ]

  condition {
    title       = "RegexObjectAccess"
    description = "Allows access only to objects matching a specific regex"
    expression  = "resource.name.startsWith(\"projects/_/buckets/${var.bucket_name}/objects/${terraform.workspace}\")"
  }
}

