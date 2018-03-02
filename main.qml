import QtQuick 2.9
import Qt3D.Core 2.0
import Qt3D.Input 2.0
import Qt3D.Render 2.0
import Qt3D.Logic 2.0
import Qt3D.Extras 2.0

Entity {
   id: rootEnt

   Camera{
       id: mainCamera
       projectionType: CameraLens.PerspectiveProjection
       fieldOfView: 65
       aspectRatio: 16.0 / 9.0
       nearPlane: 0.1
       farPlane: 1000.0
       position: Qt.vector3d(0.0,0.0,40.0)
       upVector: Qt.vector3d(0.0,0.0,30.0)
       viewCenter: Qt.vector3d(0.0,0.0,0.0)
   }

   CustomCameraControl{
       camera: mainCamera
   }

   TorusMesh{
       id: torusMesh
       radius: 15.0
       minorRadius: 6.0
       slices: 16
       rings: 256
   }

   SkyboxEntity{
       id: skyEnt
       baseName: "qrc:/Day_Skybox"

   }

   PhongMaterial{
       id: torusMaterial
       diffuse: Qt.rgba(1,0,0,0.5)
       ambient: Qt.rgba(0.2,0,0,1)
   }

   PointLight{
    id: pligth

   }

   Transform{
       id: lTransform
       translation: Qt.vector3d(0.0,0.0,60.0)
   }

   Entity{
       id: pointLigthEnt
       components: [pligth,lTransform]
   }

   Transform{
       id: torusTransform
       translation: Qt.vector3d(0.0,0.0,0.0)
   }

   components: [
   RenderSettings{
           activeFrameGraph: ForwardRenderer{
               clearColor: Qt.rgba(1,1,1,1)
               camera: mainCamera
           }
       },InputSettings{}

   ]

   Entity{
       id: torusEnt
       components: [torusMesh,torusMaterial,torusTransform]
   }

}
