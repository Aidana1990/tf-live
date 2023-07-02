provider "google" {
  project     = "folkloric-vault-388901"
  region      = "us-central1"
  credentials = "folkloric-vault-key.json"
}
resource "google_service_account" "sa" {
  account_id   = "service-account-id"
  display_name = "Service Account"
  project      = "folkloric-vault-388901"
}
resource "google_artifact_registry_repository" "gar" {
  project       = "folkloric-vault-388901"
  location      = "us-central1"
  repository_id = "hello-app-docker"
  description   = "example docker repository"
  format        = "DOCKER"

  depends_on = [google_service_account.sa]
}