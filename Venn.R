library(VennDiagram)
library(data.table)
library(ggsci)
venn.plot <- venn.diagram(
  x = list(hRPE_iRPE_hRPE_specific_ATAC$ENSEMBL,hRPE_iRPE_hRPE_specific),
  category.names = c("ATAC-seq","RNA-seq"),
  filename = "Merge ATAC-seq and RNA-seq hRPE specific genes.png", imagetype = "png",
  lwd = 2, # 圈线的厚度
  fill = pal_nejm()(6)[c(3,5)],
  alpha = 0.6,
  #label.col = "white",
  cex = 2,
  fontfamily = "serif",
  fontface = "bold",
  cat.col = pal_nejm()(6)[c(3,5)],
  cat.cex = 2,
  cat.fontfamily = "serif",
  cat.fontface = "bold",
  margin = 0.1,
  cat.dist = c(0.03, 0.03),
  cat.pos = c(-30, 20),
  height = 4200,
  width = 4400,
  main = "hRPE specific genes",
  main.cex = 3,
  main.fontfamily = "serif",
  main.fontface = "bold",
  main.pos = c(0.5, 0.9)
)