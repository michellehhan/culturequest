import Foundation
import SwiftUI

struct DragState {
    var id: UUID
    var position: CGSize = .zero
    var isDroppedOnBoard: Bool = false
    var isOnBoard: Bool = false // Add this line
}

struct DraggableIngredientView: View {
    var ingredient: Ingredient
    @Binding var dragState: DragState
    var boardFrame: CGRect // Add this parameter
    var onDragEnd: () -> Void
    var onInfoTap: () -> Void
    var onDroppedOnBoard: (UUID) -> Void // Change this line

    @GestureState private var gestureDragState: CGSize = .zero // Tracks the drag state

    var body: some View {
        ZStack {
            // Original ingredient image, always visible and stationary
            Image(ingredient.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            // Draggable "copy" of the ingredient image
            // This copy becomes visible only when dragging (i.e., when gestureDragState is not .zero)
            if gestureDragState != .zero {
                Image(ingredient.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .offset(x: gestureDragState.width, y: gestureDragState.height)
                    .zIndex(99)  // Ensure it's rendered on top
            }

            // Info button
            Button(action: onInfoTap) {
                Image(systemName: "info.circle")
                    .foregroundColor(.blue)
            }
            .offset(y: 60).padding(.top, 50)
        }
        .gesture(
            DragGesture()
                .updating($gestureDragState, body: { (value, state, _) in
                    state = value.translation
                })
            // Inside DraggableIngredientView
            // Inside DraggableIngredientView's .onEnded closure
            .onEnded { value in
                let newPosition = CGSize(width: dragState.position.width + value.translation.width, height: dragState.position.height + value.translation.height)
                let isOnBoard = isDroppedOnBoard(position: newPosition, boardFrame: boardFrame)
                
                if isOnBoard {
                    self.dragState.isDroppedOnBoard = true
                    onDroppedOnBoard(ingredient.id) // Make sure this passes UUID
                } else {
                    self.dragState.isDroppedOnBoard = false
                }
                
                onDragEnd()
            }

        )
    }

    func isDroppedOnBoard(position: CGSize, boardFrame: CGRect) -> Bool {
        // Use the passed boardFrame to check if the ingredient is dropped on the board
        let ingredientCenter = CGPoint(x: position.width + 50, y: position.height + 50)
        return boardFrame.contains(ingredientCenter)
    }
}

