import SwiftUI

struct FanControlView: View {
    @Binding var isPresented: Bool
    @State private var temperature: Int = 72
    @State private var fanSpeed: Int = 2 // 1 - 3

    var body: some View {
        VStack(spacing: 24) {
            HStack {
                Text("Climate Control")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    withAnimation { isPresented = false }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
            }

            VStack(spacing: 12) {
                Text("\(temperature)°")
                    .font(.system(size: 56, weight: .semibold))
                    .foregroundColor(.white)

                HStack(spacing: 40) {
                    Button(action: {
                        if temperature > 60 { temperature -= 1 }
                    }) {
                        ControlButton(icon: "minus")
                    }

                    Button(action: {
                        if temperature < 85 { temperature += 1 }
                    }) {
                        ControlButton(icon: "plus")
                    }
                }
            }

            VStack(spacing: 8) {
                Text("Fan Speed")
                    .font(.footnote)
                    .opacity(0.6)

                HStack(spacing: 12) {
                    ForEach(1...3, id: \.self) { speed in
                        Button(action: {
                            fanSpeed = speed
                        }) {
                            Circle()
                                .fill(speed <= fanSpeed ? Color.green : Color.gray.opacity(0.3))
                                .frame(width: 16, height: 16)
                        }
                    }
                }
            }

            Button(action: {
                // Turn off fan logic
                isPresented = false
            }) {
                Text("Turn Off Fan")
                    .foregroundColor(.red)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.05))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Spacer()
        }
        .padding()
        .background(Color.black)
        .cornerRadius(20)
        .padding(.horizontal)
        .padding(.bottom, 32)
        .transition(.move(edge: .bottom))
    }
}

struct ControlButton: View {
    var icon: String
    var body: some View {
        Image(systemName: icon)
            .font(.title2)
            .frame(width: 44, height: 44)
            .background(Color.white.opacity(0.1))
            .clipShape(Circle())
            .foregroundColor(.white)
    }
}
