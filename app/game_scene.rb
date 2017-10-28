class GameScene < SKScene
  def didMoveToView(view)
    label = SKLabelNode.labelNodeWithText('Hello, World!')
    label.position = CGPointMake(self.size.width / 2, self.size.height / 2)

    addChild(label)
  end

  def update(current_time)
    # Game Loop
  end

  def touchesBegan(touches, withEvent: event)
    scene_view = self.view
    current_frame = scene_view.session.currentFrame

    # Create anchor using the camera's current position
    if(current_frame)
      # TODO: This part doesn't work yet. matrix functions doesn't exist

      # Create a transform with a translation of 0.3 meters in front of the camera
      # translation = matrix_identity_float4x4
      # translation.columns[3].z = -0.3
      # transform = matrix_multiply(currentFrame.camera.transform, translation)

      # Add a new anchor to the session
      # anchor = ARAnchor.alloc.initWithTransform(transform)
      # scene_view.session.addAnchor(anchor)
    end
  end

end