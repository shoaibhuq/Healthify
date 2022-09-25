# Healthify
For HACKDFW 2022

## Inspiration
With the advent of telemedicine and virtual healthcare, communication between healthcare providers and their patients has become fairly efficient through the use of technology. Our idea stems from increasing the healthcare provider's ability to track and monitor patients more optimally by introducing elements of augmented reality assistance. We believe that through the use of this technology, we can make the experience more engaging for the patient while providing a streamlining of new information that is available through the AR experience.

## What it does
Our application's main functionality is the ability to accurately assist a person through movements in order to determine and isolate pain throughout their body. With simple and clean animations and the ability to track over 25 joints throughout the body with the camera on a phone, we can stretch the possibilities of telemedicine today.

An experience or "checkup" within the app starts with the user looking at an animation and a list of instructions before proceeding to a page where the camera is turned on and the AR experience starts. The user is then to follow the motion in the animation and when the app recognizes that the motion is finished, it will make a sound and transition to a screen asking about for feedback. The feedback is noted and the next set of motions is shown to the user on another page. After the routine is done, the data collected from the feedback pages are sent to the healthcare provider.

## How we built it
This application was built on SwiftUI in iOS 15. We an Apple framework called ARKit to track the joints on the body and extract their position in relative space. Using those joints as anchors, the app is able to determine whether the user is going through the motions asked of them correctly. To show the accuracy of this model, we used RealityKit to replicate the movements of the user onto a 3D robot character that would exist in the AR scene. We used Maya to create, modify, and rig all 3D models used in the app and Adobe After Effects to animate them.

## Challenges we ran into
There were a couple of challenges that we ran into. The first challenge is that this app would be a lot more applicable to the user if the machine learning model that we used to track joints with ARKit worked with the front camera. But unfortunately, with the way the Apple frameworks work on their own devices, it only works on the back camera.

Another issue is the accuracy of the model when a person is lying down on the ground. Movements and PT routines that require the user to be on the ground make the tracking become very inefficient in the current ML model that exists.

## Accomplishments that we're proud of
One of the biggest achievements that we accomplished was being able to accurately extract the transform position information out of the joint anchors on the body from the 3D space and even replicate them onto another 3D model. Using that information, we can provide real-time feedback to the user if they are doing it correctly.

## What we learned
We learned a lot more about how to track and extract information out of anchors from augmented reality. We learned how to make a better form experience for users on the mobile application interface. We learned how to efficiently work as a team and solve through issues one at a time.

## What's next for Healthify
There is so much that this app could be. Telemedicine incorporating features of AR is in the near future and we only scratched the surface of movements and check-ups that are possible with this app using AR technology. There is much more data that can be extracted, analyzed, and sent to physicians making it an easier experience for patients and healthcare providers.
