# Shared data and plotting helpers. No contributed analysis packages required.
X <- rbind(
  S1  = c(78,  0, 12,  2,  7.8, 0.2),
  S2  = c(65,  0, 18,  5, 11.5, 0.5),
  S3  = c(86,  0,  5,  1,  8.0, 0.0),
  S4  = c( 0, 82,  8,  2,  7.7, 0.3),
  S5  = c( 0, 68, 15,  4, 12.0, 1.0),
  S6  = c( 0, 75, 10,  1, 13.4, 0.6),
  S7  = c( 4,  0, 62, 25,  9.0, 0.0),
  S8  = c( 0,  3, 28, 61,  7.9, 0.1),
  S9  = c(25,  0, 18,  7, 49.5, 0.5),
  S10 = c( 0, 30, 22,  8, 39.8, 0.2))
colnames(X) <- c("B. longum", "B. breve", "E. coli",
                 "K. pneumoniae", "V. parvula", "L. reuteri")
# Synthetic stool samples from ten infants, each aged three months.
# Cross-sectional subcomposition, percent within these six taxa.
# B. longum/B. breve exclusion is imposed, not inferred.
# Neutral sample color: no experimental groups are assigned to these data.
cols <- rep("#007f82", nrow(X))
par(bg = "#f9f8f4", fg = "#24343b", col.axis = "#24343b",
    col.lab = "#24343b", family = "sans", cex = 1.25,
    mar = c(4, 4, 1, 1))
ordination_plot <- function(z, xlab = "Axis 1", ylab = "Axis 2", ...) {
  plot(z[, 1], z[, 2], asp = 1, pch = 19, cex = 1.7,
       col = cols, xlab = xlab, ylab = ylab, ...)
  text(z[, 1], z[, 2], labels = rownames(X), pos = 3, cex = 0.9)
  abline(h = 0, v = 0, col = "#d9dddd", lty = 3)
}
matrix_table <- function(x, digits = 2) {
  # Full matrices, rounded only for display. Never drop samples or columns.
  knitr::kable(x, digits = digits, format = "html",
               table.attr = 'class="matrix-table"')
}
bray_curtis <- function(x) {
  d <- matrix(0, nrow(x), nrow(x), dimnames = list(rownames(x), rownames(x)))
  for (i in seq_len(nrow(x))) for (j in seq_len(nrow(x))) {
    denom <- sum(x[i, ] + x[j, ])
    if (denom == 0) stop("Bray-Curtis undefined for two empty samples")
    d[i, j] <- sum(abs(x[i, ] - x[j, ])) / denom
  }
  as.dist(d)
}
