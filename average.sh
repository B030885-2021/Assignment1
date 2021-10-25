#!/bin/bash

echo -e "Making text files for of group comparisons. Column order will reflect that of files name, apart from groups by time, which will be ordered WT, C1, C2....."

#paste averaged values with corresponding gene id/name files
paste Clone1.0.Uninduced.id Clone1.0.Uninduced.values.nm > Clone1.0.Uninduced.values.av
paste Clone1.24.Induced.id Clone1.24.Induced.values.nm > Clone1.24.Induced.values.av
paste Clone1.24.Uninduced.id Clone1.24.Uninduced.values.nm > Clone1.24.Uninduced.values.av
paste Clone1.48.Induced.id Clone1.48.Induced.values.nm > Clone1.48.Induced.values.av
paste Clone1.48.Uninduced.id Clone1.48.Uninduced.values.nm > Clone1.48.Uninduced.values.av
paste Clone2.0.Uninduced.id Clone2.0.Uninduced.values.nm > Clone2.0.Uninduced.values.av
paste Clone2.24.Induced.id Clone2.24.Induced.values.nm > Clone2.24.Induced.values.av
paste Clone2.24.Uninduced.id Clone2.24.Uninduced.values.nm > Clone2.24.Uninduced.values.av
paste Clone2.48.Induced.id Clone2.48.Induced.values.nm > Clone2.48.Induced.values.av
paste Clone2.48.Uninduced.id Clone2.48.Uninduced.values.nm > Clone2.48.Uninduced.values.av
paste WT.0.Uninduced.id WT.0.Uninduced.values.nm > WT.0.Uninduced.values.av
paste WT.24.Induced.id WT.24.Induced.values.nm > WT.24.Induced.values.av
paste WT.24.Uninduced.id WT.24.Uninduced.values.nm > WT.24.Uninduced.values.av
paste WT.48.Induced.id WT.48.Induced.values.nm > WT.48.Induced.values.av
paste WT.48.Uninduced.id WT.48.Uninduced.values.nm > WT.48.Uninduced.values.av

#group comparisons
paste WT.0.Uninduced.id WT.values.time.nm C1.values.time.nm C2.values.time.nm > sample.groups.over.time.av
paste WT.0.Uninduced.id uninduced.nm induced.nm > uninduced.vs.induced.av
paste WT.0.Uninduced.id C1.values.time.nm C2.values.time.nm > C1.vs.C2.av
paste WT.0.Uninduced.id WT.0.Uninduced.values.nm Clone1.0.Uninduced.values.nm Clone2.0.Uninduced.values.nm > sample.groups.0.av
paste WT.0.Uninduced.id WT.24.Induced.values.nm Clone1.24.Induced.values.nm Clone2.24.Induced.values.nm > sample.groups.24.av
paste WT.0.Uninduced.id WT.48.Induced.values.nm Clone1.48.Induced.values.nm Clone2.48.Induced.values.nm > sample.groups.48.av

