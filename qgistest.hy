(import qgis)
(import [qgis.core [QgsVectorLayer]])
(import [qgis.core.contextmanagers [qgisapp]])

(setv layers [])

(defn load-layer [file name]
	(setv layer (QgsVectorLayer file name "ogr"))
	(.append layers layer))

(defn print-layer [layer]
	(print "Layer Name:" (.name layer))
	(print "Valid:" (.isValid layer))
	(print "Extents:" (.toString (.extent layer))))

(defn load-layers []
	(load-layer r"F:\gis_data\test.shp" "test")
	(for [layer layers] (print-layer layer)))

(defmain [&rest args]
	((with [[app (apply qgisapp [] {"guienabled" False})]]
		(print "Loading QGIS")
		(load-layers))))
