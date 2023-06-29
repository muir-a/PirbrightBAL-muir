## Shiny app for looking at pig BAL scRNAseq data 
## (Pirbright-Babraham collaboration)

library(iSEE)
library(SingleCellExperiment)

## load file
sce <- readRDS('data.rds')

umap1 <- ReducedDimensionPlot(Type='UMAP', 
                              PanelWidth=3L, 
                              ColorBy='Column data',
                              ColorByColumnData='cluster')
umap2 <- ReducedDimensionPlot(Type='UMAP', 
                              PanelWidth=3L,
                              ColorBy='Feature name',
                              ColorByFeatureSource='RowDataTable1',
                              BrushData = list(
                                xmin = 2.7644075243902, xmax = 8.185991793997, ymin = -10.707163129604, 
                                ymax = -6.7435131551254, coords_css = list(xmin = 224L, 
                                                                           xmax = 291L, ymin = 265L, ymax = 331L), coords_img = list(
                                                                             xmin = 448L, xmax = 582L, ymin = 530L, ymax = 662L), 
                                img_css_ratio = list(x = 2L, y = 2L), mapping = list(
                                  x = "X", y = "Y", colour = "ColorBy"), domain = list(
                                    left = -12.1972383798719, right = 11.8694766698717, 
                                    bottom = -15.6120030978154, top = 7.73219808550366), 
                                range = list(left = 78.2076198630137, right = 673.041095890411, 
                                             bottom = 825.344109589041, top = 47.9206297058845), 
                                log = list(x = NULL, y = NULL), direction = "xy", brushId = "ReducedDimensionPlot2_Brush", 
                                outputId = "ReducedDimensionPlot2"))
fap1 <- FeatureAssayPlot(PanelWidth=3L,
                         XAxis='Column data',
                         XAxisColumnData='cluster',
                         YAxisFeatureSource='RowDataTable1',
                         ColorBy = "Column selection",
                         ColumnSelectionSource = "ReducedDimensionPlot2")
rdt <- RowDataTable(PanelWidth=3L, 
                    Selected = "ENSSSCG00000036086", 
                    Search = "PAX5", 
                    HiddenColumns = c("Type", "hgnc_symbol", "chr", "start", "end"))



iSEE(sce, initial=list(umap1, umap2, fap1, rdt))



