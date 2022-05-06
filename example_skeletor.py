import skeletor as sk
import torch 
mesh = sk.example_mesh()
# print(mesh.shape)
fixed = sk.pre.fix_mesh(mesh, remove_disconnected=5, inplace=False)
skel = sk.skeletonize.by_wavefront(fixed, waves=1, step_size=1)
print(torch.tensor(skel.vertices).shape)
