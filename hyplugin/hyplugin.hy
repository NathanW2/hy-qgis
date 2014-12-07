(import PyQt4 [QtGui [QAction]])

(defn classFactory [iface]
  (HyPlugin iface))

(defclass HyPlugin []
  [[--init--
     (fn [self iface]
         (setv self.iface iface)
         None)]
   [initGui
     (fn [self]
         ((setv action QAction "Hy on QGIS")
         (.addPluginToMenu iface "Hy on QGIS" action)
          ))]
   [unload 
     (fn [self]
         ())]
   ])

(defmain [&rest args]
  (setv hytest (HyPlugin "Hello"))
  (print hytest))

